jQuery(document).ready(function($) {
    'use strict';

    if ($("#datetimepicker1").length) {
        $('#datetimepicker1').datetimepicker();

    }

    /* Calender jQuery **/

    if ($("datetimepicker2").length) {

        $('#datetimepicker2').datetimepicker({
            locale: 'ru',
            icons: {
                time: "far fa-clock",
                date: "fa fa-calendar-alt",
                up: "fa fa-arrow-up",
                down: "fa fa-arrow-down"
            }
        });
    }


    if ($("#datetimepicker3").length) {

        $('#datetimepicker3').datetimepicker({
            format: 'LT'
        });
    }

    if ($("#datetimepicker4").length) {
        $('#datetimepicker4').datetimepicker({
            format: 'L'
        });

    }
    if ($("#datetimepicker5").length) {
        $('#datetimepicker5').datetimepicker();

    }

    if ($("#datetimepicker6").length) {
        $('#datetimepicker6').datetimepicker({
            defaultDate: "2013/11/1",
            disabledDates: [
                moment("2013/12/25"),
                new Date(2013, 11 - 1, 21),
                "2013/11/22 00:53"
            ],
            icons: {
                time: "far fa-clock",
                date: "fa fa-calendar-alt",
                up: "fa fa-arrow-up",
                down: "fa fa-arrow-down"
            }
        });
    }

    if ($("#datetimepicker7").length) {
        $(function() {
            $('#datetimepicker7').datetimepicker({
                icons: {
                    time: "far fa-clock",
                    date: "fa fa-calendar-alt",
                    up: "fa fa-arrow-up",
                    down: "fa fa-arrow-down"
                }
            });
            $('#datetimepicker8').datetimepicker({
                useCurrent: false,
                icons: {
                    time: "far fa-clock",
                    date: "fa fa-calendar-alt",
                    up: "fa fa-arrow-up",
                    down: "fa fa-arrow-down"
                }
            });
            $("#datetimepicker7").on("change.datetimepicker", function(e) {
                $('#datetimepicker8').datetimepicker('minDate', e.date);
            });
            $("#datetimepicker8").on("change.datetimepicker", function(e) {
                $('#datetimepicker7').datetimepicker('maxDate', e.date);
            });
        });
    }



    if ($("#datetimepicker10").length) {
        $('#datetimepicker10').datetimepicker({
            viewMode: 'years',
            icons: {
                time: "far fa-clock",
                date: "fa fa-calendar-alt",
                up: "fa fa-arrow-up",
                down: "fa fa-arrow-down"
            }
        });
    }

    if ($("#datetimepicker11").length) {
        $('#datetimepicker11').datetimepicker({
            viewMode: 'years',
            format: 'YYYY/MM'
        });
    }

	if ($("#datetimepicker13").length) {
	     $('#datetimepicker13').datetimepicker({
	            inline: true,
	            sideBySide: true
	        });
	
	}
	
	if ($("#datetimepickerStartDate").length) {
        $('#datetimepickerStartDate').datetimepicker({
            format: 'L'
        });
    }
    
    if ($("#datetimepickerEndDate").length) {
        $('#datetimepickerEndDate').datetimepicker({
            format: 'L'
        });
    }

});