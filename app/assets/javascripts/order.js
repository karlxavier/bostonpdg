$(function() {

    $('select.brandpicker').on('change', function(e){
        getAddress(this.value)
    });

    $('select.clone_products').on('change', function(e){
        $.ajax({
            method: "GET",
            url: "/api/simple/products/"+this.value
        }).done(function( data ) {
            $('#clone_product_name').val(data.name);
            $('#clone_category_id').val(data.category);
            $('#clone_item_category_id').val(data.item_category_id);
            $('#clone_vendor_id').val(data.vendor_id);
            $('#clone_specs').val(data.specs)
            $('#clone_vendor_quote_prices').val(data.vendor_quote_prices)
            $('#clone_notes').val(data.notes)
            $('#clone_product_attributes').html('');
            $('.clone_categories').selectpicker('refresh');
            foo = JSON.parse(data.convert_dynamic_fields);
            Object.keys(foo)
                .forEach(function eachKey(key) {
                    clone_product_attributes_2(key, foo[key]);
                });
        });
    });

    $('.selectpicker').selectpicker('refresh');
    $('.selectpicker2').selectpicker('refresh');
    var addNewProductDropzone = new Dropzone("#add-new-product", {
        url: '/order_entries',
        autoProcessQueue: false,
        uploadMultiple: true,
        parallelUploads: 10,
        maxFiles: 10,
        previewsContainer: '#dropzonePreview',
        clickable: '#dropzonePreview',

        // The setting up of the dropzone
        init: function () {
            var myDropzone = this;
            myDropzone = this; // closure

            this.element.querySelector('#save').addEventListener("click", function(e) {
                // Make sure that the form isn't actually being sent.
                e.preventDefault();
                e.stopPropagation();
                if (myDropzone.getQueuedFiles().length === 0) {
                    submitNewProduct();
                }
                else {
                    setAttributesOnForm($('#add-new-product'));
                    myDropzone.processQueue();

                }
            });
            this.on("successmultiple", function(files, response) {
                // Gets triggered when the files have successfully been sent.
                // Redirect user or notify of success.
                var data = response;
                myDropzone.removeAllFiles( true );
                $('#product_name').val('');
                $('#category_id').val('');
                $('#item_category_id').val('');
                $('#vendor_id').val('');
                $('#specs').val('');
                $('#vendor_quote_prices').val('');
                $('.default_attributes').val('');
                $('#notes').val('')
                $('#product_attributes').html('');
                $('.categories').selectpicker('refresh');
                if (product_list.length === 0 && entry_list.length === 0) {
                    $('.stitched').html('')
                }
                product_list.push(data.id)
                order_entries = $('.stitched').html();
                $('.stitched').html(order_entries + "<div class='col-md-1 nopadding text-align-right row-button-" + data.id + "'><div class='form-group'> <button class='btn btn-outline-danger' type='button' onclick='removeOrderEntry(" + data.id + ");'> <span class='fa fa-trash-o' aria-hidden='true'></span> </button></div></div><div class='col-md-11 nopadding text-align-left row-name-" + data.id + "'><div class='form-group'>" + data.name + "</div></div><div class='clear'></div>")

            });
        }
    });

    var addCloneProductDropzone = new Dropzone("#add-clone-product", {
        url: '/api/simple/products/create_item',
        autoProcessQueue: false,
        uploadMultiple: true,
        parallelUploads: 10,
        maxFiles: 10,
        previewsContainer: '#dropzoneClonePreview',
        clickable: '#dropzoneClonePreview',

        // The setting up of the dropzone
        init: function () {
            var myDropzone = this;
            myDropzone = this; // closure

            this.element.querySelector('#save-clone').addEventListener("click", function(e) {
                // Make sure that the form isn't actually being sent.
                e.preventDefault();
                e.stopPropagation();
                if (myDropzone.getQueuedFiles().length === 0) {
                    submitNewClonedProduct();
                }
                else {
                    setCloneAttributesOnForm($('#add-clone-product'));
                    myDropzone.processQueue();

                }
            });
            this.on("successmultiple", function(files, response) {
                // Gets triggered when the files have successfully been sent.
                // Redirect user or notify of success.
                var data = response;
                myDropzone.removeAllFiles( true );
                $('#clone_product_id').val('');
                $('#clone_product_name').val('');
                $('#clone_category_id').val('');
                $('#clone_item_category_id').val('');
                $('#clone_vendor_id').val('');
                $('#clone_specs').val('')
                $('#clone_vendor_quote_prices').val('')
                $('#clone_notes').val('')
                $('#clone_product_attributes').html('');
                $('.clone_categories').selectpicker('refresh');
                $('.clone_products').selectpicker('refresh');
                if (product_list.length === 0) {
                    $('.stitched').html('')
                }
                product_list.push(data.id)
                order_entries = $('.stitched').html();
                $('.stitched').html(order_entries + "<div class='col-md-1 nopadding text-align-right row-button-" + data.id + "'><div class='form-group'> <button class='btn btn-outline-danger' type='button' onclick='removeOrderEntry(" + data.id + ");'> <span class='fa fa-trash-o' aria-hidden='true'></span> </button></div></div><div class='col-md-11 nopadding text-align-left row-name-" + data.id + "'><div class='form-group'>" + data.name + "</div></div><div class='clear'></div>")

            });
        }
    });

});


function getAddress(id) {
    if (id == null || id == '') {
        id = $('#order_brand_id').val()
    }
    $.ajax({
        method: "GET",
        url: "/api/simple/hotels?brand_id="+id
    }).done(function( data ) {
        $('#brand-list').html('');
        all_address_list = [];
        data.forEach(function (item, index, arr) {
            all_address_list.push(item['id']);
            brand_list = $('#brand-list').html();
            $('#brand-list').html(brand_list + "<a class='btn btn-nav select-items' onclick='selectAndUnselect(" + item['id'] + ", $(this) )'> " + item['name'] + "</a>&nbsp;");
        });
    });

}
function selectAndUnselect(id, elem) {
    if (address_list.includes(id)) {
        for(var i = address_list.length - 1; i >= 0; i--) {
            if(address_list[i] === id) {
                address_list.splice(i, 1);
            }
        }
        elem.removeClass('btn-yellow');
    }else{
        address_list.push(id);
        elem.addClass('btn-yellow');
    }
}

function selectAllBranches() {
    $('.select-items').removeClass('btn-yellow');
    $('.select-items').addClass('btn-yellow');
    address_list = all_address_list;
}

function unselectAllBranches() {
    $('.select-items').removeClass('btn-yellow');
    address_list = [];
}

function in_array(array, id) {
    for(var i=0;i<array.length;i++) {
        return (array[i] === id)
    }
    return false;
}

function submitFormWithVal(id, elem) {
    form_id = "#"+id;
    var input = $("<input>")
        .attr("type", "hidden")
        .attr("name", "order_branch").val(address_list);
    var input2 = $("<input>")
        .attr("type", "hidden")
        .attr("name", "order_entries").val(product_list);
    $(form_id).append($(input));
    $(form_id).append($(input2));
    if (entry_list.length > 0) {
        var input3 = $("<input>")
            .attr("type", "hidden")
            .attr("name", "existing_entries").val(entry_list);
        $(form_id).append($(input3));
    }
    $( form_id ).submit();
    $(elem).attr('disabled','disabled');
    $(elem).addClass( "disabled" );
    $(elem).html('Please Wait...');
}

function submitNewClonedProduct() {
    var product_name = $('#clone_product_name').val();
    var category_id = $('#clone_category_id').val();
    var item_category_id = $('#clone_item_category_id').val();
    var vendor_id = $('#clone_vendor_id').val();
    var specs =  $('#clone_specs').val();
    var vendor_quote_prices = $('#clone_vendor_quote_prices').val();
    var notes = $('#clone_notes').val();

    var dynamic_fields = {};
    var field_names = $('input[name=clone_order_field_name]');
    var field_values = $('input[name=clone_order_field_value]');

    for(var i = field_names.length - 1; i >= 0; i--) {
        dynamic_fields[$(field_names[i]).val()] = $(field_values[i]).val();
    }
    if (product_name != '' && (category_id != '' || item_category_id != '')) {
        $.ajax({
            method: "POST",
            url: "/api/simple/products/create_item",
            data: {product_name: product_name, category_id: category_id, item_category_id: item_category_id, specs: specs, vendor_quote_prices: vendor_quote_prices, notes: notes, dynamic_fields: dynamic_fields, vendor_id: vendor_id}
        }).done(function( data ) {
            $('#clone_product_id').val('');
            $('#clone_product_name').val('');
            $('#clone_category_id').val('');
            $('#clone_item_category_id').val('');
            $('#clone_vendor_id').val('');
            $('#clone_specs').val('')
            $('#clone_vendor_quote_prices').val('')
            $('#clone_notes').val('')
            $('#clone_product_attributes').html('');
            $('.clone_categories').selectpicker('refresh');
            $('.clone_products').selectpicker('refresh');
            if (product_list.length === 0 && entry_list.length === 0) {
                $('.stitched').html('')
            }
            product_list.push(data.id)
            order_entries = $('.stitched').html();
            $('.stitched').html(order_entries + "<div class='col-md-1 nopadding text-align-right row-button-" + data.id + "'><div class='form-group'> <button class='btn btn-outline-danger' type='button' onclick='removeOrderEntry(" + data.id + ");'> <span class='fa fa-trash-o' aria-hidden='true'></span> </button></div></div><div class='col-md-11 nopadding text-align-left row-name-" + data.id + "'><div class='form-group'>" + data.name + "</div></div><div class='clear'></div>")
        });
    }

}
function submitNewProduct() {
    var product_name = $('#product_name').val();
    var category_id = $('#category_id').val();
    var item_category_id = $('#item_category_id').val();
    var vendor_id = $('#vendor_id').val();
    var specs =  $('#specs').val();
    var vendor_quote_prices = $('#vendor_quote_prices').val();
    var notes = $('#notes').val();
    var dynamic_fields = {};

    var field_names = $('input[name=order_field_name]');
    var field_values = $('input[name=order_field_value]');

    for(var i = field_names.length - 1; i >= 0; i--) {
        dynamic_fields[$(field_names[i]).val()] = $(field_values[i]).val();
    }
    if (product_name != '' && (category_id != '' || item_category_id != '')) {
        $.ajax({
            method: "POST",
            url: "/api/simple/products/create_item",
            data: {product_name: product_name, category_id: category_id, item_category_id: item_category_id, specs: specs, vendor_quote_prices: vendor_quote_prices, notes: notes, dynamic_fields: dynamic_fields, vendor_id: vendor_id}
        }).done(function( data ) {
            $('#product_name').val('');
            $('#category_id').val('');
            $('#item_category_id').val('');
            $('#vendor_id').val('');
            $('#specs').val('');
            $('#vendor_quote_prices').val('');
            $('.default_attributes').val('');
            $('#notes').val('')
            $('#product_attributes').html('');
            $('.categories').selectpicker('refresh');
            if (product_list.length === 0 && entry_list.length === 0) {
                $('.stitched').html('')
            }
            product_list.push(data.id)
            order_entries = $('.stitched').html();
            $('.stitched').html(order_entries + "<div class='col-md-1 nopadding text-align-right row-button-" + data.id + "'><div class='form-group'> <button class='btn btn-outline-danger' type='button' onclick='removeOrderEntry(" + data.id + ");'> <span class='fa fa-trash-o' aria-hidden='true'></span> </button></div></div><div class='col-md-11 nopadding text-align-left row-name-" + data.id + "'><div class='form-group'>" + data.name + "</div></div><div class='clear'></div>")
        });
    }

}

function addExistingItem() {
    var id = $('#product_id').val()
    $.ajax({
        method: "GET",
        url: "/api/simple/products/"+id
    }).done(function( data ) {
        $('#product_id').val('');
        $('.products').selectpicker('refresh');
        if (product_list.length === 0 && entry_list.length === 0) {
            $('.stitched').html('')

        }
        product_list.push(data.id)
        order_entries = $('.stitched').html();
        $('.stitched').html(order_entries + "<div class='col-md-1 nopadding text-align-right row-button-" + data.id + "'><div class='form-group'> <button class='btn btn-outline-danger' type='button' onclick='removeOrderEntry(" + data.id + ");'> <span class='fa fa-trash-o' aria-hidden='true'></span> </button></div></div><div class='col-md-11 nopadding text-align-left row-name-" + data.id + "'><div class='form-group'>" + data.name + "</div></div><div class='clear'></div>")
    });
}

function removeOrderEntry(id) {
    if (product_list.includes(id)) {
        for(var i = product_list.length - 1; i >= 0; i--) {
            if(product_list[i] === id) {
                product_list.splice(i, 1);
            }
        }
        $('.row-button-'+id).remove();
        $('.row-name-'+id).remove();

        if (product_list.length === 0 && entry_list.length === 0) {
            $('.stitched').html("<div class='col'>Empty</div>")
        }
    }
}
function removeOrderEntryWithId(id, entry_id) {
    if (entry_list.includes(entry_id)) {
        for(var i = entry_list.length - 1; i >= 0; i--) {
            if(entry_list[i] === entry_id) {
                entry_list.splice(i, 1);
            }
        }
        console.log(entry_list);
        $('.row-button-'+id).remove();
        $('.row-name-'+id).remove();

        if (product_list.length === 0 && entry_list.length === 0) {
            $('.stitched').html("<div class='col'>Empty</div>")
        }
    }
}