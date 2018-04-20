<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="description" content="">
<meta name="author" content="Rizvi">
<meta name="keyword"
	content="Php, Hospital, Clinic, Management, Software, Php, CodeIgniter, Hms, Accounting">
<link rel="shortcut icon" href="uploads/favicon.png">
<title>test</title>
<!-- Bootstrap core CSS -->
<link href="common/css/bootstrap.min.css" rel="stylesheet">
<link href="common/css/bootstrap-reset.css" rel="stylesheet">
<!--external css-->
<link href="common/assets/font-awesome/css/font-awesome.css"
	rel="stylesheet" />
<link href="common/assets/DataTables/datatables.min.css"
	rel="stylesheet" />
<!-- Custom styles for this template -->
<link href="common/css/style.css" rel="stylesheet">
<link href="common/css/style-responsive.css" rel="stylesheet" />
<link rel="stylesheet"
	href="common/assets/bootstrap-datepicker/css/datepicker.css" />
<link rel="stylesheet" type="text/css"
	href="common/assets/bootstrap-daterangepicker/daterangepicker-bs3.css" />
<link rel="stylesheet" type="text/css"
	href="common/assets/bootstrap-datetimepicker/css/datetimepicker.css" />
<link rel="stylesheet" type="text/css"
	href="common/assets/jquery-multi-select/css/multi-select.css" />
<link href="common/css/invoice-print.css" rel="stylesheet" media="print">
<link
	href="common/assets/fullcalendar/fullcalendar/bootstrap-fullcalendar.css"
	rel="stylesheet">

</head>
<body>

	<div class="">
		<div class="adv-table editable-table ">
			<div class="clearfix">
				<!--  <div class="col-lg-12"> -->
				<div class="">
					<!--   <section class="panel"> -->
					<section class=""> <!--   <div class="panel-body"> -->
					<div class="">
						<style>
.payment {
	padding-top: 20px;
	padding-bottom: 20px;
	border: none;
}

.pad_bot {
	padding-bottom: 10px;
}

form {
	border: 1px solid #ccc;
	box-shadow: 0 2px 5px 0 rgba(0, 0, 0, 0.16), 0 2px 10px 0
		rgba(0, 0, 0, 0.12);
	background: transparent;
}

.pos {
	padding-left: 0px;
}

.form-control {
	font-size: 14px;
	font-weight: 600;
	box-shadow: 0 2px 5px 0 rgba(0, 0, 0, 0.16), 0 2px 10px 0
		rgba(0, 0, 0, 0.12);
}
</style>

						<form role="form" class="clearfix pos form1" id="editPaymentForm"
							action="finance/addPayment" method="post"
							enctype="multipart/form-data">
							<div class="col-md-6">
								<div class="col-md-8 payment">
									<div class="form-group last">
										<div class="col-md-3 payment_label">
											<label for="exampleInputEmail1"> Select Item</label>
										</div>
										<div class="col-md-9">
											<select name="products" id="" class="multi-select"
												multiple="" id="my_multi_select3">
												<c:forEach var="product" items="${allProducts}">

													<option class="ooppttiioonn" data-id="2855"
														data-s_price="${product.price}"
														data-m_name="${product.name}"
														data-c_name="${product.supplierID}"
														value="2855">${product.name}</option>
												</c:forEach>
											</select>
										</div>
									</div>
								</div>
							</div>
							<div class="col-md-2 qfloww">
								<p class="title">Selected Items</p>
							</div>
							<div class="col-md-4 right-six">
								<div class="col-md-12 payment right-six">
									<div class="col-md-3 payment_label">
										<label for="exampleInputEmail1"> Sub Total</label>
									</div>
									<div class="col-md-9">
										<input type="text" class="form-control pay_in" name="subtotal"
											id="subtotal" value='' placeholder=" " disabled>
									</div>

								</div>
								<div class="col-md-12 payment right-six">
									<div class="col-md-3 payment_label">
										<label for="exampleInputEmail1"> Discount </label>
									</div>
									<div class="col-md-9">
										<input type="text" class="form-control pay_in" name="discount"
											id="dis_id" value='' placeholder="Discount">
									</div>
								</div>

								<div class="col-md-12 payment right-six">
									<div class="col-md-3 payment_label">
										<label for="exampleInputEmail1"> Gross Total</label>
									</div>
									<div class="col-md-9">
										<input type="text" class="form-control pay_in" name="grsss"
											id="gross" value='' placeholder=" " disabled>
									</div>

								</div>


								<div class="col-md-12 payment right-six">
									<div class="col-md-12">
										<div class="col-md-3"></div>
										<div class="col-md-6">
											<button type="submit" name="submit" class="btn btn-info">
												Submit</button>
										</div>
										<div class="col-md-3"></div>
									</div>
								</div>
								<!--
                                            <div class="col-md-12 payment">
                                                <div class="col-md-3 payment_label"> 
                                                  <label for="exampleInputEmail1">Vat (%)</label>
                                                </div>
                                                <div class="col-md-9"> 
                                                  <input type="text" class="form-control pay_in" name="vat" id="exampleInputEmail1" value='' placeholder="%">
                                                </div>
                                            </div>
                                            -->

								<input type="hidden" name="id" value=''>
								<div class="row"></div>
								<div class="form-group"></div>

							</div>
						</form>
					</div>
					</section>
				</div>
			</div>
		</div>
	</div>
	</section>

	</section>
	</section>
	<!--main content end-->
	<!--footer start-->

	<script src="common/js/codearistos.min.js"></script>


	<style>
.remove {
	margin: 0px;
	width: 50%;
	margin-top: 9px;
	height: 28px;
	border: 1px solid #eee;
	box-shadow: 0 2px 5px 0 rgba(0, 0, 0, 0.16), 0 2px 10px 0
		rgba(0, 0, 0, 0.12);
}
</style>

	<script>
    $(document).ready(function () {
        var tot = 0;
        $(".ms-selected").click(function () {
            var id = $(this).data('id');
            $('#id-div' + id).remove();
            $('#idinput-' + id).remove();
            $('#mediidinput-' + id).remove();

        });
        $.each($('select.multi-select option:selected'), function () {
            var unit_price = $(this).data('s_price');
            var cs = $(this).data('cs');
            var id = $(this).data('id');
            var qtity = $(this).data('qtity');
            if ($('#idinput-' + id).length)
            {

            } else {
                if ($('#id-div' + id).length)
                {

                } else {

                    $("#editPaymentForm .qfloww").append('<div class="remove1" id="id-div' + id + '"><div class="name pos_element"> Product Name: ' + $(this).data("m_name") + '</div><br><div class="company pos_element">Supplier ID: ' + $(this).data("c_name") + '</div><br><div class="price pos_element">Price: ' + $(this).data('s_price') + '</div><br><div class="current_stock pos_element">Remove this part: ' + $(this).data('cs') + '</div><br><div class="quantity pos_element">Quantity:<div></div>')
                }
                var input2 = $('<input>').attr({
                    type: 'text',
                    class: "remove",
                    id: 'idinput-' + id,
                    name: 'quantity[]',
                    value: qtity,
                }).appendTo('#editPaymentForm .qfloww');

                $('<input>').attr({
                    type: 'hidden',
                    class: "remove",
                    id: 'mediidinput-' + id,
                    name: 'medicine_id[]',
                    value: id,
                }).appendTo('#editPaymentForm .qfloww');
            }
            $(document).ready(function () {
                $('#idinput-' + id).keyup(function () {
                    var qty = 0;
                    var total = 0;
                    $.each($('select.multi-select option:selected'), function () {
                        var id1 = $(this).data('id');
                        qty = $('#idinput-' + id1).val();
                        var ekokk = $(this).data('s_price');
                        total = total + qty * ekokk;
                    });
                    tot = total;
                    var discount = $('#dis_id').val();
                    var gross = tot - discount;
                    $('#editPaymentForm').find('[name="subtotal"]').val(tot).end()
                    $('#editPaymentForm').find('[name="grsss"]').val(gross)
                });
            });
            var curr_val = $(this).data('s_price') * $('#idinput-' + id).val();
            tot = tot + curr_val;
        });
        var discount = $('#dis_id').val();
        var gross = tot - discount;
        $('#editPaymentForm').find('[name="subtotal"]').val(tot).end()
        $('#editPaymentForm').find('[name="grsss"]').val(gross)
        //  });
    });
    $(document).ready(function () {
        $('#dis_id').keyup(function () {
            var val_dis = 0;
            var amount = 0;
            var ggggg = 0;
            amount = $('#subtotal').val();
            val_dis = this.value;
            ggggg = amount - val_dis;
            $('#editPaymentForm').find('[name="grsss"]').val(ggggg)
        });
    });

</script>



	<script>
    $(document).ready(function () {
        $('.multi-select').change(function () {
            var tot = 0;
            $(".ms-selected").click(function () {
                var id = $(this).data('id');
                $('#id-div' + id).remove();
                $('#idinput-' + id).remove();
                $('#mediidinput-' + id).remove();

            });
            $.each($('select.multi-select option:selected'), function () {
                var unit_price = $(this).data('s_price');
                var cs = $(this).data('cs');
                var id = $(this).data('id');
                if ($('#idinput-' + id).length)
                {

                } else {
                    if ($('#id-div' + id).length)
                    {

                    } else {

                        $("#editPaymentForm .qfloww").append('<div class="remove1" id="id-div' + id + '"><div class="name pos_element"> Product Name: ' + $(this).data("m_name") + '</div><br><div class="company pos_element">Supplier ID: ' + $(this).data("c_name") + '</div><br><div class="price pos_element">Price: ' + $(this).data('s_price') + '</div><br><div class="current_stock pos_element">//Remove this//: ' + $(this).data('cs') + '</div><br><div class="quantity pos_element">Quantity:<div></div>')
                    }
                    var input2 = $('<input>').attr({
                        type: 'text',
                        class: "remove",
                        id: 'idinput-' + id,
                        name: 'quantity[]',
                        value: '1',
                    }).appendTo('#editPaymentForm .qfloww');

                    $('<input>').attr({
                        type: 'hidden',
                        class: "remove",
                        id: 'mediidinput-' + id,
                        name: 'medicine_id[]',
                        value: id,
                    }).appendTo('#editPaymentForm .qfloww');
                }

                $(document).ready(function () {
                    $('#idinput-' + id).keyup(function () {
                        var qty = 0;
                        var total = 0;
                        $.each($('select.multi-select option:selected'), function () {
                            var id1 = $(this).data('id');
                            qty = $('#idinput-' + id1).val();
                            var ekokk = $(this).data('s_price');
                            total = total + qty * ekokk;
                        });

                        tot = total;

                        var discount = $('#dis_id').val();
                        var gross = tot - discount;
                        $('#editPaymentForm').find('[name="subtotal"]').val(tot).end()
                        $('#editPaymentForm').find('[name="grsss"]').val(gross)
                    });
                });
                var curr_val = $(this).data('s_price') * $('#idinput-' + id).val();
                tot = tot + curr_val;
            });
            var discount = $('#dis_id').val();
            var gross = tot - discount;
            $('#editPaymentForm').find('[name="subtotal"]').val(tot).end()
            $('#editPaymentForm').find('[name="grsss"]').val(gross)
        });
    });
    $(document).ready(function () {
        $('#dis_id').keyup(function () {
            var val_dis = 0;
            var amount = 0;
            var ggggg = 0;
            amount = $('#subtotal').val();
            val_dis = this.value;
                ggggg = amount - val_dis;
            $('#editPaymentForm').find('[name="grsss"]').val(ggggg)
        });
    });

</script>



	<!-- Add Patient Modal-->
	<div class="modal fade" id="myModal" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel" aria-hidden="true"
		style="display: none;">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-hidden="true">×</button>
					<h4 class="modal-title">
						<i class="fa fa-plus-circle"></i> Patient Registration
					</h4>
				</div>
				<div class="modal-body">
					<form role="form" action="patient/addNew?redirect=payment"
						method="post" enctype="multipart/form-data">
						<div class="form-group">
							<label for="exampleInputEmail1">Name</label> <input type="text"
								class="form-control" name="name" id="exampleInputEmail1"
								value='' placeholder="">
						</div>

						<div class="form-group">
							<label for="exampleInputEmail1">Address</label> <input
								type="text" class="form-control" name="address"
								id="exampleInputEmail1" value='' placeholder="">
						</div>
						<div class="form-group">
							<label for="exampleInputEmail1">Phone</label> <input type="text"
								class="form-control" name="phone" id="exampleInputEmail1"
								value='' placeholder="">
						</div>

						<div class="form-group">
							<label for="exampleInputEmail1">Image</label> <input type="file"
								name="img_url">
						</div>

						<input type="hidden" name="id" value=''>

						<section class="">
						<button type="submit" name="submit" class="btn btn-info">Submit</button>
						</section>
					</form>

				</div>
			</div>
			<!-- /.modal-content -->
		</div>
		<!-- /.modal-dialog -->
	</div>
	<!-- Add Patient Modal-->


	<script src="common/js/codearistos.min.js"></script>
	<script>
    $(document).ready(function () {
        $(".flashmessage").delay(3000).fadeOut(100);
    });
</script>
	<footer class="site-footer">
	<div class="text-center">
		2018 &copy; Pharmacy Management System by Code Aristos. <a
			href="http://pharmacy.rajbari-bazar.com/finance/addPaymentView#"
			class="go-top"> <i class="fa fa-angle-up"></i>
		</a>
	</div>
	</footer>
	<!--footer end-->
	</section>

	<!-- js placed at the end of the document so the pages load faster -->
	<script src="common/js/jquery.js"></script>
	<script src="common/js/jquery-1.8.3.min.js"></script>
	<script src="common/js/bootstrap.min.js"></script>
	<script src="common/js/jquery.scrollTo.min.js"></script>
	<!--
<script src="common/js/jquery.nicescroll.js" type="text/javascript"></script>
-->
	<script type="text/javascript"
		src="common/assets/DataTables/datatables.min.js"></script>
	<script src="common/js/respond.min.js"></script>
	<script type="text/javascript"
		src="common/assets/bootstrap-datepicker/js/bootstrap-datepicker.js"></script>
	<script type="text/javascript"
		src="common/assets/bootstrap-datetimepicker/js/bootstrap-datetimepicker.js"></script>
	<script type="text/javascript"
		src="common/assets/bootstrap-datepicker/js/bootstrap-datepicker.js"></script>

	<script type="text/javascript"
		src="common/assets/jquery-multi-select/js/jquery.multi-select.js"></script>
	<script type="text/javascript"
		src="common/assets/jquery-multi-select/js/jquery.quicksearch.js"></script>
	<script type="text/javascript" src="common/assets/ckeditor/ckeditor.js"></script>
	<script src="common/js/advanced-form-components.js"></script>
	<script src="common/js/jquery.cookie.js"></script>
	<!--common script for all pages-->
	<script src="common/js/common-scripts.js"></script>
	<script class="include" type="text/javascript"
		src="common/js/jquery.dcjqaccordion.2.7.js"></script>
	<script
		src="common/assets/fullcalendar/fullcalendar/fullcalendar.min.js"></script>
	<script src="common/js/external-dragging-calendar.js"></script>
	<!--script for this page only-->
	<script src="common/js/editable-table.js"></script>
	<!-- END JAVASCRIPTS -->
	<script>


    $(document).ready(function () {
        $('#editable-sample').DataTable({
            responsive: true,
            //   dom: 'lfrBtip',



            dom: "<'row'<'col-sm-3'l><'col-sm-6 text-center'B><'col-sm-3'f>>" +
                    "<'row'<'col-sm-12'tr>>" +
                    "<'row'<'col-sm-5'i><'col-sm-7'p>>",

            buttons: [
                'copyHtml5',
                'excelHtml5',
                'csvHtml5',
                'pdfHtml5',
                'print'

            ],

            aLengthMenu: [
                [10, 25, 50, 100, -1],
                [10, 25, 50, 100, "All"]
            ],
            iDisplayLength: -1,

            "order": [[0, "desc"]],
            
            "language": {
                "lengthMenu": "_MENU_ records per page",
            }





        });
    });</script>

	<script>
    $('#calender').fullCalendar()
</script>

	<script>
    $('.multi-select').multiSelect({
        selectableHeader: "<input type='text' class='search-input' autocomplete='off' placeholder=' search...'>",
        selectionHeader: "<input type='text' class='search-input' autocomplete='off' placeholder=''>",
        afterInit: function (ms) {
            var that = this,
                    $selectableSearch = that.$selectableUl.prev(),
                    $selectionSearch = that.$selectionUl.prev(),
                    selectableSearchString = '#' + that.$container.attr('id') + ' .ms-elem-selectable:not(.ms-selected)',
                    selectionSearchString = '#' + that.$container.attr('id') + ' .ms-elem-selection.ms-selected';
            that.qs1 = $selectableSearch.quicksearch(selectableSearchString)
                    .on('keydown', function (e) {
                        if (e.which === 40) {
                            that.$selectableUl.focus();
                            return false;
                        }
                    });
            that.qs2 = $selectionSearch.quicksearch(selectionSearchString)
                    .on('keydown', function (e) {
                        if (e.which == 40) {
                            that.$selectionUl.focus();
                            return false;
                        }
                    });
        },
        afterSelect: function () {
            this.qs1.cache();
            this.qs2.cache();
        },
        afterDeselect: function () {
            this.qs1.cache();
            this.qs2.cache();
        }
    });</script>

	<script>
    $('#my_multi_select3').multiSelect();
</script>


</body>
</html>