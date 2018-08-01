// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require rails-ujs
//= require turbolinks
//= require jquery.min
//= require popper.min
//= require bootstrap.min
//= require grasp_mobile_progress_circle-1.0.0.min
//= require jquery.cookie
//= require jquery.validate.min
//= require jquery.mCustomScrollbar.concat.min
//= require ladda-spin
//= require ladda.min
//= require ladda.jquery
//= require toastr.min
//= require front
//= require slimscroll
//= require dropzone
//= require chatbox_dropzone
//= require nestable
//= require cable
//= require watcher
//= require chosen

$(document).on('turbolinks:load', function() {
    $('.selectpicker').selectpicker();
    $('.selectpicker2').selectpicker();
    $('.categories').selectpicker();
    $('.brandpicker').selectpicker();
    $('.clone_categories').selectpicker();
    $('.clone_products').selectpicker();


    $(function() {
        $(".dropdown").bind('keydown', function (event) {
            if (event.keyCode === 9) {
                $(this).find('.selectpicker').selectpicker('toggle');
                $(this).find('.selectpicker2').selectpicker('toggle');
                $(this).find('.categories').selectpicker('toggle');
                $(this).find('.brandpicker').selectpicker('toggle');
                $(this).find('.clone_categories').selectpicker('toggle');
                $(this).find('.clone_products').selectpicker('toggle');
            }
        });
        $("#view_history").click(function () {
//            $('#viewProducts').modal('hide');
            $('#viewHistories').modal('show');
        });
       /* $('#viewHistories').on('hidden.bs.modal', function (e) {
            $('#viewProducts').modal('show');
        })*/
    });


});


var room = 1;
function product_attributes() {
    room++;
    var objTo = document.getElementById('product_attributes')
    var divtest = document.createElement("div");
    divtest.setAttribute("class", "row form-group removeclass"+room);
    var rdiv = 'removeclass'+room;
    divtest.innerHTML = '<div class="col-md-4 nopadding"><div class="form-group"> <input type="text" class="form-control" id="order[field_name][]" name="order_field_name" value="" placeholder="Attribute Name"></div></div><div class="col-md-6 nopadding"><div class="form-group"> <input type="text" class="form-control" id="order[field_value][]" name="order_field_value" value="" placeholder="Attribute Value"></div></div><div class="col-md-2 nopadding"><div class="form-group"> <button class="btn btn-outline-danger" type="button" onclick="remove_education_fields('+ room +');"> <span class="fa fa-trash-o" aria-hidden="true"></span> </button></div></div><div class="clear"></div>'

    objTo.appendChild(divtest)
}
function clone_product_attributes() {
    room++;
    var objTo = document.getElementById('clone_product_attributes')
    var divtest = document.createElement("div");
    divtest.setAttribute("class", "row form-group removeclass"+room);
    var rdiv = 'removeclass'+room;
    divtest.innerHTML = '<div class="col-md-4 nopadding"><div class="form-group"> <input type="text" class="form-control" id="order[field_name][]" name="clone_order_field_name" value="" placeholder="Attribute Name"></div></div><div class="col-md-6 nopadding"><div class="form-group"> <input type="text" class="form-control" id="order[field_value][]" name="clone_order_field_value" value="" placeholder="Attribute Value"></div></div><div class="col-md-2 nopadding"><div class="form-group"> <button class="btn btn-outline-danger" type="button" onclick="remove_education_fields('+ room +');"> <span class="fa fa-trash-o" aria-hidden="true"></span> </button></div></div><div class="clear"></div>'

    objTo.appendChild(divtest)
}
function clone_product_attributes_2(key, val) {
    room++;
    var objTo = document.getElementById('clone_product_attributes')
    var divtest = document.createElement("div");
    divtest.setAttribute("class", "row form-group removeclass"+room);
    var rdiv = 'removeclass'+room;
    divtest.innerHTML = '<div class="col-md-4 nopadding"><div class="form-group"> <input type="text" class="form-control" id="order[field_name][]" name="clone_order_field_name" placeholder="Attribute Name" value="' + key + '"></div></div><div class="col-md-6 nopadding"><div class="form-group"> <input type="text" class="form-control" id="order[field_value][]" name="clone_order_field_value" placeholder="Attribute Value" value="' + val + '"></div></div><div class="col-md-2 nopadding"><div class="form-group"> <button class="btn btn-outline-danger" type="button" onclick="remove_education_fields('+ room +');"> <span class="fa fa-trash-o" aria-hidden="true"></span> </button></div></div><div class="clear"></div>'

    objTo.appendChild(divtest)
}
function add_product_attributes() {
    room++;
    var objTo = document.getElementById('add_product_attributes')
    var divtest = document.createElement("div");
    divtest.setAttribute("class", "row form-group removeclass"+room);
    var rdiv = 'removeclass'+room;
    divtest.innerHTML = '<div class="col-md-4 nopadding"><div class="form-group"> <input type="text" class="form-control" id="order[field_name][]" name="add_order_field_name" value="" placeholder="Attribute Name"></div></div><div class="col-md-6 nopadding"><div class="form-group"> <input type="text" class="form-control" id="order[field_value][]" name="add_order_field_value" value="" placeholder="Attribute Value"></div></div><div class="col-md-2 nopadding"><div class="form-group"> <button class="btn btn-outline-danger" type="button" onclick="remove_education_fields('+ room +');"> <span class="fa fa-trash-o" aria-hidden="true"></span> </button></div></div><div class="clear"></div>'

    objTo.appendChild(divtest)
}
function add_product_attributes_2(key, val) {
    room++;
    var objTo = document.getElementById('add_product_attributes')
    var divtest = document.createElement("div");
    divtest.setAttribute("class", "row form-group removeclass"+room);
    var rdiv = 'removeclass'+room;
    divtest.innerHTML = '<div class="col-md-4 nopadding"><div class="form-group"> <input type="text" class="form-control" id="order[field_name][]" name="add_order_field_name" placeholder="Attribute Name" value="' + key + '"></div></div><div class="col-md-6 nopadding"><div class="form-group"> <input type="text" class="form-control" id="order[field_value][]" name="add_order_field_value" placeholder="Attribute Value" value="' + val + '"></div></div><div class="col-md-2 nopadding"><div class="form-group"> <button class="btn btn-outline-danger" type="button" onclick="remove_education_fields('+ room +');"> <span class="fa fa-trash-o" aria-hidden="true"></span> </button></div></div><div class="clear"></div>'

    objTo.appendChild(divtest)
}
function remove_education_fields(rid) {
    $('.removeclass'+rid).remove();
}

function onSearchFilter() {
    // Declare variables
    var input, filter, div, buttons, btn, i;
    input = document.getElementById("filterSearch");
    filter = input.value.toUpperCase();
    div = document.getElementsByClassName("item-list");
    buttons = div[0].getElementsByTagName("button");

    // Loop through all table rows, and hide those who don't match the search query
    for (i = 0; i < buttons.length; i++) {
        btn = buttons[i]
        if (btn) {
            if (btn.innerHTML.toUpperCase().indexOf(filter) > -1) {
                btn.style.display = "";
            } else {
                btn.style.display = "none";
            }
        }
    }
}

function submitForm(id, elem) {
    form_id = "#"+id;
    $( form_id ).submit();
    $(elem).attr('disabled','disabled');
    $(elem).html('Please Wait...');
}

function showEditOrderEntries(id) {
    $.ajax({
        method: "GET",
        url: "/api/simple/order_entries/"+id
    }).done(function( data ) {
        console.log(data);
        console.log(data.category_id);
        $('#edit_order_entry').find('#order_entry_id').val(data.id);
        $('#edit_order_entry').find('#order_entry_category_id').val(data.category_id);
        $('#edit_order_entry').find('#order_entry_vendor').val(data.vendor_list);
        $('#edit_order_entry').find('#order_entry_product_id').val(data.product_id);
        $('#edit_order_entry').find('#order_entry_quoted_by').val(data.quoted_by);
        $('#edit_order_entry').find('#order_entry_price').val(data.price);
        $('#edit_order_entry').find('#order_entry_cost').val(data.cost);
        $('#edit_order_entry').find('#order_entry_tax').val(data.tax);
        $('#edit_order_entry').find('#order_entry_quantity').val(data.quantity);
        $('#editOrderEntries').modal('show');
        $('.selectpicker2').selectpicker('refresh')
        $('.selectpicker').selectpicker('refresh')
    });

}

function showEditOrder(id) {
    $.ajax({
        method: "GET",
        url: "/api/simple/orders/"+id
    }).done(function( data ) {
        $('#edit_order').find('#order_id').val(data.id);
        $('#edit_order').find('#order_status').val(data.status);
        $('#edit_order').find('#order_brand_id').val(data.brand_id);
        $('#edit_order').find('#order_total_budget').val(data.total_budget);
        $('#edit_order').find('#order_lead_time').val(data.lead_time);
        $('#editOrder').modal('show');
        $('.selectpicker').selectpicker('refresh')
    });

}

function itemDetails(id, entry_id) {
    $.ajax({
        method: "GET",
        url: "/api/simple/products/"+id
    }).done(function( data ) {
        $('#add_product_attributes').html('');
        $('#add_product_id').val(data.id);
        $('#add_product_id_2').val(data.id);
        $('#order_entry_id_2').val(entry_id);
        $('#order_entry_id_3').val(entry_id);
        $("#pic1").attr("src", data.picture_url);
        $('.product-name-header').html("(" + data.name + ")");
       /* $('#clone_category_id').html(data.category);
        $('#clone_item_category_id').val(data.item_category_id);*/
        if (data.specs != "" && data.specs != null && data.specs != undefined) {
            $('#nav-specs').html(data.specs_html)
            $('#add_specs').val(data.specs_html);
        }
        if (data.vendor_quote_prices != "" && data.vendor_quote_prices != null && data.vendor_quote_prices != undefined) {
            $('#nav-quotes').html(data.vendor_quote_prices_html)
            $('#add_vendor_quote_prices').val(data.vendor_quote_prices_html);
        }
        if (data.notes != "" && data.notes != null && data.notes != undefined) {
            $('#nav-notes').html(data.notes_html)
            $('#add_notes').val(data.notes_html);
        }
        $('#dynamic-attributes').html('');
        if (data.convert_dynamic_fields != '' && data.convert_dynamic_fields != null && data.convert_dynamic_fields != undefined) {
            foo = JSON.parse(data.convert_dynamic_fields);
            Object.keys(foo)
                .forEach(function eachKey(key) {
                    add_product_attributes_2(key, foo[key]);
                    dynamic_attributes = $('#dynamic-attributes').html();
                    $('#dynamic-attributes').html(dynamic_attributes + "<tr style='margin-bottom: 2%'><td> <span class='float-left'>" + key + "</span> <span class='float-right'>" + foo[key] + "</span></td></tr>");
                });
        }else{
            $('#dynamic-attributes').html('No Attributes Available');
        }

        $.ajax({
            method: "GET",
            url: "/order_entries/history?id="+entry_id
        }).done(function( data ) {
            $('#order_entry_histories').html('');
            $('#order_entry_histories').html(data);
            $('#viewProducts').modal('show');
        });
    });
}

function openEditAttributes() {
    $('#viewProducts').modal('hide');
    $('#editAttributes').modal('show');
}

function openViewItems() {
    $('#editFreeFlow').modal('hide');
    $('#editAttributes').modal('hide');
    $('#viewProducts').modal('show');
}

function openEditFreeFlow() {
    $('#viewProducts').modal('hide');
    $('#editFreeFlow').modal('show');
}


function submitEditAttributes() {
    var product_id = $('#add_product_id').val();
    var entry_id = $('#order_entry_id_3').val();
    var dynamic_fields = {};
    var field_names = $('input[name=add_order_field_name]');
    var field_values = $('input[name=add_order_field_value]');

    for(var i = field_names.length - 1; i >= 0; i--) {
        dynamic_fields[$(field_names[i]).val()] = $(field_values[i]).val();
    }
        $.ajax({
            method: "POST",
            url: "/api/simple/products/update_product",
            data: {id: product_id, dynamic_fields: dynamic_fields}
        }).done(function( data ) {
            $('#editAttributes').modal('hide');
            itemDetails(data.id, entry_id);
        });

}

function submitEditFreeFlow() {
    var product_id = $('#add_product_id').val();
    var entry_id = $('#order_entry_id_3').val();
    var specs =  $('#add_specs').val();
    var vendor_quote_prices = $('#add_vendor_quote_prices').val();
    var notes = $('#add_notes').val();
    $.ajax({
        method: "POST",
        url: "/api/simple/products/update_product",
        data: {id: product_id, specs: specs, vendor_quote_prices: vendor_quote_prices, notes: notes}
    }).done(function( data ) {
        $('#editFreeFlow').modal('hide');
        itemDetails(data.id, entry_id);
    });

}


