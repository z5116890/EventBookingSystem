$(document).ready(function() {
    $('.list_events').each(function (idx, e) {
        var load_more = true;
        var no_more = false;
        // immediately load when it's not in index page
        if (location.href.indexOf('index') === -1) {
            fetchData();
        } else {
            $(window).scroll(function() {
                var wScoll = $(this).scrollTop();
                if (wScoll > $('.content').offset().top - ($(window).height() / 1.6) && load_more) {
                    fetchData();
                }
            });
        }

        function fetchData() {
            load_more = false
            str = $(e).find($('.list_events_content')).data('page');
            var regex = /(.+)_(.+)/g;
            var match = regex.exec(str);

            var type = match[1];
            var page = match[2];

            $(e).find($('.list_events_footer')).html(`
                <div class="loading_button">
                    <i class="fa fa-spinner fa-spin" style="font-size:48px"></i>
                </div>
            `);
            $(e).find($('.list_events_footer')).addClass('is-showing');
            setTimeout(function() {
                $.ajax({
                    type: $(this).attr('method'), 
                    url: '/load_more', 
                    data: {
                        type: type,
                        page: page,
                    },
                    context: this,
                    success: function(data, status) {
                        if (data.status === 'no more') {
                            no_more = true;
                            let html = `
                                <div class="no_more">
                                    <h4>END OF THE LIST</h4>
                                </div>
                            `;
                            if($('.list_events_body').html().replace(/\s/mg, '') == '' &&
                                window.location.pathname == '/dashboard') {
                                let format = {
                                    'missing': 'events',
                                    'help':    '', 
                                    'link':    ''
                                };
                                if(type == 'closedPosts' || type == 'attended') {
                                    format['missing'] = 'past ' + format['missing'];
                                } else if (type == 'cancelled') {
                                    format['missing'] = 'cancelled ' + format['missing'];
                                }

                                if(type == 'attending') {
                                    format['help'] = 'find some ';
                                    format['link'] = '/';
                                } else if(type == 'openPosts') {
                                    format['help'] = 'create one ';
                                    format['link'] = '/add_event';
                                }

                                let help = format['help'] ? `, ${format.help}` : '';
                                let link = format['link'] ? `<a href="${format.link}">here</a>` : '';
                                html = `<div style="color: #333; text-align: center;"><h3>
                                    You don\'t seem to have any ${format.missing}${help}${link}
                                </h3></div>`;
                            }
                            $(e).find($('.list_events_footer')).html(html);
                            return;
                        }
                        $(e).find($('.list_events_footer')).removeClass('is-showing');
                        setTimeout(function() {
                            $(e).find($('.list_events_body')).append(data.html)
                            $(e).find($('.list_events_content')).data('page', type + '_' + data.page);
                            load_items()
                            load_more = true;
                        }, 700);
                    }
                });
            }, 700);            
        }

        $(e).find($('.filter-group-label')).each((idx, filter) => {
            var target = $(filter).data('filter');
            $(filter).click((event) => {
                $(e).find($('.list_events_body')).html('')
                $(e).find($('.list_events_content')).data('page', target + '_' + 0);
                load_more = true;
                no_more = false;             
                fetchData()
            });
        });

        $(window).scroll(function() {
            var wScoll = $(this).scrollTop();
            var trigger = false;

            if ($(e).find($('.list_events_body .events_row')).length > 0 && ($(e).find($('.list_events_body .events_row')).eq(-1).offset().top - wScoll) < $(window).height()/1.5)
                trigger = true;

            if (trigger && load_more && !no_more) {
                fetchData();
            }
        });
    });
});

function load_items() {
    $('.list_events_body figure:not(".is-showing")').each(function(i, x) {
        setTimeout(function() {
            $(x).addClass('is-showing');
        }, 130 * (i + 1));
    });
}
