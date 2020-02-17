(() => {
    class SeminarPrompt {
        constructor(modal) {
            this.modal = modal || null;
            this.caller = null;
        }

        bindModal(modal) {
            this.modal = modal;
            return this;
        }

        prepare(evt) {
            this.caller = evt.target;
        }

        show() {
            this.modal.modal('show');
        }
    }

    class SeminarTable {
        constructor(table, pmpt) {
            this.prompt   = pmpt  || null;
            this.table    = table || null;
            this.sessions = [];
        }

        setSession(sess) {
            if(sess.id < this.sessions.length) {
                this.sessions.push(sess);
            } else {
                this.sessions[sess.id - 1] = sess;
            }
        }

        bindTable(sel) {
            this.table = $(sel);
            return this;
        }

        bindPrompt(pmpt) {
            this.prompt = pmpt;
            return this;
        }

        initDOM() {
            this.table.on('click', '[data-session-id]', evt => {
                this.prompt.prepare(evt);
                this.prompt.show();
            });
        }

        render() {
            let body = $('tbody', this.table);

            for(let session of this.sessions) {
                let tr = $('<tr>');
                Object.values(session).forEach(l => tr.append($(`<td>${l}</td>`)));

                body.append(tr);
            }

            return this;
        }

        json() {
            return JSON.stringify(this.sessions);
        }
    }

    const FORM_FIELDS = ["name", "desc", "cover", "cap", "type", "session"];
    class EventForm {
        constructor(s) {
            this.form = $(s);
        }

        query(nm) {
            return $(`[name="${nm}"]`, this.form);
        }

        extractFields() {
            //todo: consider using FormData for this
            let data = {};
            for(field of FORM_FIELDS) {
                data[field] = this.query(field).val(); 
            }
            return data;
        }

        post(url) {
            //todo: post
        }
    }

    class SessionForm {
        constructor(s) {
            this.type = "course";
            this.seminar = {
                table:  new SeminarTable(),
                prompt: new SeminarPrompt()
            };
            this.course = [];
        }

        setType(t) {
            this.type = t;
            return this;
        }

        uiUpdate() {
            $(`[data-event-type]`).each((i, e) => {
                e.style.setProperty('display', $(e).data('eventType') == this.type ? '' : 'none');
            });
        }

        serialize() {
            if(this.type == "course") {
                return JSON.stringify(this.course);
            } else {
                return this.seminar.table.json();
            }
        }
    }


    $(document).ready(() => {
        let event = new EventForm('#event-det');
        let sess  = new SessionForm('#event-session-det');

        event.query('type').on('change', function() {
            sess.setType(this.value);
            sess.uiUpdate();
        });

        // Bring up session edit/creation modal on table row click
        $('#session-list tbody').on('click', '[data-session-id]', function() {
            let $this = $(this);
            let sessId = +$this.data('sessionId');
            if(sessId == 0) {
                // If we created a new row, it session id is one greater than the previous
                sessId = ++maxSessId;
            } else {
                // We need to load content into the modal
                ["sessid", "start", "end", "venue", "speaker"].forEach((n, i) => {
                    $(`[name="${n}"]`).val(this.children[i].textContent);
                });
            }

            let mdl = $('#event-session-modal');
            $('input[name="sessid"]', mdl).val(sessId);
            mdl.modal('show');
        });

        // Update table on session register
        $('#event-session-update').on('click', function() {
            // Get fields
            let sessDat = {};
            $('#event-session-modal [name]').each((i, e) => {
                let v = e.value;
                e.value = '';
                sessDat[e.name] = v; 
            });
            console.log(sessDat);

            // Create a row
            let row = createTableRow(Object.values(sessDat));
            row.attr('data-session-id', sessDat['sessid']);

            // Check if a row with the current sessId exists
            let matchingRows = $('[data-session-id]').filter((i, e) => +e.children[0].textContent == +sessDat['sessid']);

            // If we don't find a row, add one, otherwise just replace an existing one
            if(matchingRows.length == 0) {
                row.insertBefore('[data-session-id=""]');
            } else {
                matchingRows.replaceWith(row);
            }

            // close the modal
            $('#event-session-modal').modal('hide');
        });


        $('#event-form').on('submit', function(evt) {
            // When the form is submitted, we want to inject our own code
            // i.e. we serialize all session data into the hidden session input
            evt.preventDefault();
            evt.stopPropagation();

            let $this = $(this);
            $('[name="session"]', $this).val(JSON.stringify(serializeSession(currtype)));
            let fields = extractFormFields($this);

            console.log(fields);
        });
    });

})();
