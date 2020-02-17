(() => {
    /**
     * extractFormFields
     * Given a form, extracts the useful event data from the inputs
     * @param form {HTMLFormElement} Form to extract out of
     * @returns {FormData}   Object of data from form
     */
    function extractFormFields(form) {
        const fields = ["name", "desc", "cap", "type", "session", "venue", "deregister", "earlybird"];

        let data = new FormData();
        for(field of fields) {
            data.append(field, $(`[name="${field}"]`, form).val());
        }
        return data;
    }

    /**
     * serializeSession
     * Serializes the sesssion part of the event into a json object 
     * @param sessType {'course'|'seminar'} Type of the current session (course/seminar)
     * @returns {string} serialized input 
     */
    function serializeSession(sessType) {
        if(sessType == "seminar") {
            return seminars.serialize();
        } else if (sessType == "course") {
            let curSer = {};
            ['sessname', 'start', 'end', 'venue', 'sesscap'].forEach((s) => {
                curSer[s] = $(`[data-event-type="${sessType}"] [name="${s}"]`).val();
            });
            
            return JSON.stringify([curSer]); 
        } else {
            throw new TypeError("Unknown session type: " + sessType);
        }
    }

    function getFile(el, form, fd) {
        $.each($(`[name="${el}"]`, form).prop('files'), (k,v) => fd.append(el, v));
    }

    function displayError(err, alertE) {
        alertE = alertE || '#event-err';
        console.log(`.alert${alertE}`)
        $(`.alert${alertE}`).show().html(`<strong>Error:</strong> ${err.message}`);
        if(err.dom && err.dom.code == "EI") {
            let e = err.dom.item ? $(`[name="${err.dom.item}"]`) : err.dom.target;
            e.addClass('is-invalid')
             .on('change', function() { $(this).removeClass('is-invalid'); });
        }
    }

    class SeminarTable {
        constructor(dom) {
            this.table = [];
            this.dom   = dom || null;
        }
        
        bindDom(dom) {
            this.dom = $(dom);
            return this;
        } 

        save(dat) {
            if(dat.sessid <= this.table.length) {
                this.table[dat.sessid-1] = dat;
            } else {
                this.table.push(dat);
            }

            return this;
        }

        delete(sessid) {
            sessid--;
            this.table.splice(sessid, 1);
            return this.reindex();
        }

        reindex() {
            for(let i = 0; i < this.table.length; i++) {
                this.table[i].sessid = i+1;
            }
            return this;
        }

        extract(form) {
            let sessDat = {};
            $('[name]', form).each((i, e) => {
                sessDat[e.name] = e.type == "checkbox" ? e.checked : e.value; 
                e.value = '';
            });
            return this.save(sessDat);
        }

        sync(rowRender) {
            if(!this.dom) { throw new DOMError("SeminarTable required dom to be bound before usage"); }

            let tbody = $('tbody', this.dom);
            tbody.children().not('[data-session-id=""]').empty();

            this.table.forEach(entry => rowRender(entry).insertBefore('[data-session-id=""]'));
            return this;
        }

        row(i, sessid=true) {
            let idx = sessid ? i-1 : i;
            return idx < this.table.length ? this.table[idx] : null;
        }

        nextID() {
            return this.table.length + 1;
        }

        serialize(serializer=JSON.stringify) {
            return serializer(this.table);
        }
    }

    function formatEntry(value, name, context) {
        switch(name) {
            case "start":
            case "end":
                return (new Date(value)).toLocaleString();
            case "venue":
                return $(`#event-session-modal #event-venue option[value="${value}"]`).text();
            case "speakername":
                return value + (context.speakerguest ? ' <small>Guest</small>' : '');
            default:
                return value;
        }
    }

    function renderer(row) {
        const blacklist = ["speaker", "speakeremail", "speakerguest"];
        let newRow = $('<tr>'); 
        Object.entries(row).forEach(([k, v]) => {
            if(!blacklist.includes(k)) {
                v = formatEntry(v, k, row);
                newRow.append($(`<td>${v}</td>`));
            }
        });
        newRow.attr('data-session-id', row['sessid']);

        // Add the delete button
        newRow.append('<td>&times;</td>')

        return newRow;
    }

    function validateEvents() {
        // Check required fields are not empty
        // This is handed off to the backend to do

        // Check Event capacity is valid
        let cap = $('#event-cap');
        if(+cap.val() <= 0) {
            displayError({
                'message': 'Event capacity must be greater than zero',
                'dom': {'code': 'EI', 'target': cap}
            });
            return false;
        }

        let dereg = $('#event-deregister');
        if(+dereg.val() < 0) {
            displayError({
                'message': 'Deregistration Timeframe must be greater than or equal to zero',
                'dom': {'code': 'EI', 'target': dereg} 
            });
            return false;
        }

        let early_bird = $('#event-earlybird');
        if(+early_bird.val() < 0) {
            displayError({
                'message': 'Early bird days must be greater than or equal to zero',
                'dom': {'code': 'EI', 'target': early_bird} 
            });
            return false;
        }

        return true;
    }

    function validateSession(root, alertE) {
        let name  = $('#session-name', root);
        let start = $('#event-start',  root);
        let end   = $('#event-end',    root);
        let cap   = $('#session-cap',  root);

        let startTime = (new Date(start.val())).getTime();
        let endTime   = (new Date(end.val())).getTime();

        // if(name.val().length == 0) {
        //     displayError({
        //         'message': 'A session must have a name',
        //         'dom': {'code': 'EI', 'target': name}
        //     }, alertE);
        //     return false;
        // }

        if(isNaN(startTime)) {
            displayError({
                'message': 'Start time is not a valid date',
                'dom': {'code': 'EI', 'target': start}
            }, alertE);
            return false;
        }

        if(isNaN(endTime)) {
            displayError({
                'message': 'End time is not a valid date',
                'dom': {'code': 'EI', 'target': end}
            }, alertE);
            return false;
        }

        if(endTime <= startTime) {
            displayError({
                'message': 'An event must have a end time after its start time',
                'dom': {'code': 'EI', 'target': end} 
            }, alertE);
            return false;
        }

        if(+cap.val() <= 0) {
            displayError({
                'message': 'Session capacity must be greater than zero',
                'dom': {'code': 'EI', 'target': cap} 
            }, alertE);
            return false;
        }

        return true;
    }

    function validateSeminar() {
        let root = $('#event-session-modal');
        if(!validateSession(root, '#seminar-alert')) { return false; } 

        let speakerid = $('[name="speaker"]',     root);
        let guest     = $('#event-speaker-guest', root);
        let email     = $('#event-speaker-email', root);
        let name      = $('#event-speaker',       root);

        if(guest[0].checked) {
            if(email.val().length == 0) {
                displayError({
                    'message': 'A guest user must have a email',
                    'dom': {'code': 'EI', 'target': email}
                }, '#seminar-alert');
                return false;
            }
            if(name.val().length == 0) {
                displayError({
                    'message': 'A guest user must have a name',
                    'dom': {'code': 'EI', 'target': name}
                }, '#seminar-alert');
                return false;
            }
        } else {
            if(speakerid.val().length == 0) {
                displayError({
                    'message': 'The searched speaker is not in the system, please make a guest speaker',
                    'dom': {'code': 'EI', 'target': name}
                }, '#seminar-alert');
                return false;
            }
        }

        return true;
    }

    let currtype     = "course";
    let guestSpeaker = false;
    let seminars     = new SeminarTable();
    $(document).ready(() => {
        var users = [];
        let sessdet = $('#event-session-det');
        let semmdl  = $('#event-session-modal');
        seminars.bindDom('#session-list');

        function fetchUserList() {
            $.get({url: '/user/list', data: {isGuest: guestSpeaker}}).done(usrs => {
                users = usrs;
                $.typeahead({
                    input: '#event-speaker',
                    order: "desc",
                    template: '<span>{{name}} <small>{{email}}</small></span>',
                    emptyTemplate: 'No exisiting users matching "{{query}}"',
                    source: {
                        display: 'name',
                        data: users
                    },
                    callback: {
                        onInit: () => {
                            let e = document.querySelector('.typeahead__result');
                            if(e) { e.parentElement.removeChild(e); }
                            $('#event-speaker').val('');
                        },
                        onClickAfter: (_, __, entry) => {
                            // if(guestSpeaker) { return; }
                            $('[name="speaker"]').val(entry.id);
                            $('[name="speakeremail"]').val(entry.email);
                        } 
                    }
                });
            }).catch(err => displayError(err));
        }

        // Update session input method on event-type change
        $('#event-type').on('change', function() {
            currtype = this.value;
            $('[data-event-type]').toggle();
        }); 

        // Bring up session edit/creation modal on table row click
        $('#session-list tbody').on('click', '[data-session-id]', function(evt) {
            let sessId = +$(this).data('sessionId');
            if($(evt.target).is(':last-child') && sessId != 0) {
                seminars.delete(sessId).sync(renderer);
            } else {
                // We need to load content into the modal
                Object.entries(seminars.row(sessId) || {
                    sessid: sessId == 0 ? seminars.nextID() : sessId
                }).forEach(([n, v]) => $(`[name="${n}"]`, semmdl).val(v));

                semmdl.modal('show');
            }
        });

        // Update table on session register
        $('#event-session-update').on('click', function() {
            if(!validateSeminar()) { return; }
            $('.alert#seminar-alert').hide();
            seminars.extract(semmdl).sync(renderer);
            semmdl.modal('hide');
        });

        $('#event-form').on('submit', function(evt) {
            // When the form is submitted, we want to inject our own code
            // i.e. we serialize all session data into the hidden session input
            evt.preventDefault();
            evt.stopPropagation();

            if(!validateEvents()) { return; }
            if(currtype == "course") {
                if(!validateSession($('[data-event-type="course"]'))) { return; }
            }

            let $this = $(this);
            $('[name="session"]', $this).val(serializeSession(currtype));

            let fields = extractFormFields($this);

            getFile('cover',   $this, fields);
            getFile('album[]', $this, fields);
  
            $.post({
                url:  './add_event',
                data: fields,
                processData: false,
                contentType: false
            }).done(r  => window.location.href = `/event/${r.evt}`)
              .catch(r => displayError(r.responseJSON))
        });

        $('#event-session-modal #event-speaker-guest').on('click', (e) => {
            // $('#event-speaker-email').parent().toggle();
            guestSpeaker = !guestSpeaker;
            fetchUserList();
        });

        fetchUserList();

        $('#event-speaker').on('blur', function(){
            if(guestSpeaker) { return; }
            // Check if the current value is in the users list, if it isnt reset inputs
            for(u of users) { if(u.name == this.value) { return; } }

            $('[name="speaker"]').val('');
            $('[name="speakeremail"]').val('');
        });
    });
})();
