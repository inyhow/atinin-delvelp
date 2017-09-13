(function($) {
    $.fn.explr = $.fn.explrTree = function(method) {
        var defaults = {
            ajaxContainerId: 'explr-content',
            ajaxLoadingText: '<p>loading..</p>',
            ajaxOptions: {},
            animDuration: 'fast',
            folderTooltip: 'open/close',
            rememberState: true,
            startCollapsed: true,
            treeHeight: 'auto',
            treeWidth: 'auto'
        };
        var helpers = {
            getState: function($uls) {
                return $uls.map(function() {
                    if ($(this).is(':hidden')) {
                        return 0;
                    } else {
                        return 1;
                    }
                }).get().join(',');
            },
            cookie: function(p, id, arr, r) {
                if (r) {
                    if (p === 'set') {
                        document.cookie = 'explr-' + id + '=' + escape(arr);
                    } else {
                        var dc = document.cookie;
                        var index = dc.indexOf('explr-' + id + '=');
                        if (index >= 0) {
                            if (p === 'check') {
                                return true;
                            };
                            var start = index + id.length + 7;
                            var end = dc.indexOf(';', start);
                            if (start !== id.length) {
                                if (end === -1) {
                                    end = dc.length;
                                };
                                return unescape(dc.substring(start, end));
                            }
                        };
                        return false;
                    }
                };
                return false;
            }
        };
        var methods = {
            init: function(options) {
                var opts = $.extend(defaults, options);
                return this.each(function() {
                    var $tree = $(this);
                    var treeId = $tree.attr('id');
                    $tree.addClass('explr-tree').css({
                        'height': opts.treeHeight,
                        'width': opts.treeWidth
                    }).find('li:not(:last-child) > ul').addClass('explr-line-fix').end().find('li').prepend('<span class="explr-line"></span>').not(':has(ul)').addClass('explr-text').end().has('ul').prepend('<span class="explr-plus2" title="' + opts.folderTooltip + '"><i class="icon-plus-sign-alt"></i></span>').delegate('.explr-plus2, a[href="#"]', 'click',
                        function(e) {
                            $(this).siblings('ul').slideToggle(opts.animDuration,
                                function() {
                                    helpers.cookie('set', treeId, helpers.getState($tree.find('ul')), opts.rememberState);
                                }).siblings('.explr-plus2').toggleClass('explr-minus2');
                            //html('<i class="icon-minus-sign-alt"></i>')
                            if ($(this).attr("class") == 'explr-plus2') {
                                $(this).html('<i class="icon-plus-sign-alt"></i>');
                            } else {
                                $(this).html('<i class="icon-minus-sign-alt"></i>');
                            }
                            return false;
                        });
                    $tree.delegate('a[href="#"]', 'click',
                        function(e) {
                            e.preventDefault();
                        });
                    $tree.delegate('a[rel*="explr-ajax"]', 'click',
                        function() {
                            $('#' + opts.ajaxContainerId).html(opts.ajaxLoadingText);
                            var ajaxDefault = {
                                dataType: 'html',
                                url: $(this).attr('href'),
                                error: function(xhr) {
                                    $('#' + opts.ajaxContainerId).html(xhr.statusText + ' ' + xhr.status);
                                },
                                success: function(data) {
                                    $('#' + opts.ajaxContainerId).html(data);
                                }
                            };
                            $.ajax($.extend(ajaxDefault, opts.ajaxOptions));
                            return false;
                        });
                    if (helpers.cookie('check', treeId, false, opts.rememberState)) {
                        var uls = helpers.cookie('get', treeId, false, opts.rememberState).split(',');
                        var ulIndex = 0;
                        $tree.find('ul').each(function() {
                            if (parseInt(uls[ulIndex], 10)) {
                                $(this).siblings('.explr-plus2').addClass('explr-minus2').html('<i class="icon-minus-sign-alt"></i>');
                            } else {
                                $(this).hide();
                            };
                            ulIndex += 1;
                        });
                    } else if (opts.startCollapsed) {
                        $tree.find('ul').hide().end().find('.explr-expand').show().siblings('.explr-plus2').addClass('explr-minus2').html('<i class="icon-minus-sign-alt"></i>');
                    } else {
                        $tree.find('.explr-collapse').hide().end().find('ul:not(.explr-collapse)').siblings('.explr-plus2').addClass('explr-minus2').html('<i class="icon-minus-sign-alt"></i>');
                    };
                });
            }
        };
        if (methods[method] && method.toLowerCase() != 'init') {
            return methods[method].apply(this, Array.prototype.slice.call(arguments, 1));
        } else if (typeof method === 'object' || !method) {
            return methods.init.apply(this, arguments);
        } else {
            $.error('Method "' + method + '" does not exist in Explr');
        }
    };
} (jQuery));