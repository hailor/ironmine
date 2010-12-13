jQuery(function ($) {
    var csrf_token = $('meta[name=csrf-token]').attr('content'),
        csrf_param = $('meta[name=csrf-param]').attr('content');

    $.fn.extend({
        /**
         * Triggers a custom event on an element and returns the event result
         * this is used to get around not being able to ensure callbacks are placed
         * at the end of the chain.
         *
         * TODO: deprecate with jQuery 1.4.2 release, in favor of subscribing to our
         *       own events and placing ourselves at the end of the chain.
         */
        triggerAndReturn: function (name, data) {
            var event = new $.Event(name);
            this.trigger(event, data);

            return event.result !== false;
        },

        /**
         * Handles execution of remote calls firing overridable events along the way
         */
        callRemote: function () {
            var el      = this,
                method  = el.attr('method') || el.attr('data-method') || 'GET',
                url     = el.attr('action') || el.attr('href'),
                dataType  = el.attr('data-type')  || 'script';

            if (url === undefined) {
              throw "No URL specified for remote call (action or href must be present).";
            } else {
                if (el.triggerAndReturn('ajax:before')) {
                    var data = el.is('form') ? el.serializeArray() : [];
                    $.ajax({
                        url: url,
                        data: data,
                        dataType: dataType,
                        type: method.toUpperCase(),
                        beforeSend: function (xhr) {
                            el.trigger('ajax:loading', xhr);
                        },
                        success: function (data, status, xhr) {
                            el.trigger('ajax:success', [data, status, xhr]);
                        },
                        complete: function (xhr) {
                            el.trigger('ajax:complete', xhr);
                        },
                        error: function (xhr, status, error) {
                            el.trigger('ajax:failure', [xhr, status, error]);
                        }
                    });
                }

                el.trigger('ajax:after');
            }
        }
    });

    /**
     *  confirmation handler
     */
    $('a[data-confirm],input[data-confirm]').live('click', function () {
        var el = $(this);
        if (el.triggerAndReturn('confirm')) {
            if (!confirm(el.attr('data-confirm'))) {
                return false;
            }
        }
    });


    /**
     * remote handlers
     */
    $('form[data-remote]').live('submit', function (e) {
        $(this).callRemote();
        e.preventDefault();
    });


    if (jQuery.browser.msie){
       $("form[data-remote]").find("input[type='submit'],button[type='submit'],input[name='commit']").live('click',function(e) {
           $(this).parents("form[data-remote]").callRemote();
           if(e.preventDefault) e.preventDefault();
       });
    }
    //else{
    //   $("form[data-remote]").find("a[type='submit']").live('click',function(e) {
    //       $(this).parents("form[data-remote]").callRemote();
    //       if(e.preventDefault) e.preventDefault();
    //   });
    //}


    $('a[data-remote],input[data-remote]').live('click', function (e) {
        $(this).callRemote();
        e.preventDefault();
    });

    $('a[data-method]:not([data-remote])').live('click', function (e){
        var link = $(this),
            href = link.attr('href'),
            method = link.attr('data-method'),
            form = $('<form method="post" action="'+href+'"></form>'),
            metadata_input = '<input name="_method" value="'+method+'" type="hidden" />';

        if (csrf_param != null && csrf_token != null) {
          metadata_input += '<input name="'+csrf_param+'" value="'+csrf_token+'" type="hidden" />';
        }

        form.hide()
            .append(metadata_input)
            .appendTo('body');

        e.preventDefault();
        form.submit();
    });

    /**
     * disable-with handlers
     */
    var disable_with_input_selector = 'input[data-disable-with]';
    var disable_with_form_selector = 'form[data-remote]:has(' + disable_with_input_selector + ')';

    $(disable_with_form_selector).live('ajax:before', function () {
        $(this).find(disable_with_input_selector).each(function () {
            var input = $(this);
            input.data('enable-with', input.val())
                 .attr('value', input.attr('data-disable-with'))
                 .attr('disabled', 'disabled');
        });
    });

    $(disable_with_form_selector).live('ajax:complete', function () {
        $(this).find(disable_with_input_selector).each(function () {
            var input = $(this);
            input.removeAttr('disabled')
                 .val(input.data('enable-with'));
        });
    });
});

//扩展jquery
jQuery(function ($) {
    $.fn.extend({
        astab: function () {
            var el      = this,
                zone    = el.attr('zone');
            el.find('.jtabcontainer').each(function(){
              if($(this).attr('zone')){zone = $(this).attr('zone');}
              $(this).find('.jtabitem').unbind('click');
              $(this).find('.jtabitem').bind('click',function(e){
                  var source = ($(this).find('a:first').attr('href')||"").replace(/^\s+|\s+$/g,"");
                  if(source !='#'&&$('#'+zone).length>0)
                  {
                    $('#'+zone).load(source);
                  }
                  $(this).addClass('selected');
                  $(this).siblings('.selected').removeClass('selected');
                  if(e.preventDefault) e.preventDefault();
              });
              $(this).find('.jtabitem.selected:first').length>0? $(this).find('.jtabitem.selected:first').trigger('click') :$(this).find('.jtabitem:first').trigger('click');
            });
        }
    });
    $('a[zone]').live('click',function(e){
        var zone    = $(this).attr('zone');
        var source = ($(this).attr('href')||"").replace(/^\s+|\s+$/g,"");
        if(source !='#'&&$('#'+zone).length>0)
        {
          $('#'+zone).load(source,function(response, status, xhr) {init('#'+zone);});
        }
        if(e.preventDefault) e.preventDefault();
    });
    $("form").find("a[type='submit']").live('click',function(e) {
      $(this).parents("form:first").submit();
      if(e.preventDefault) e.preventDefault();
    });
});