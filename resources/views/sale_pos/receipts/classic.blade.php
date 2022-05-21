<!-- business information here -->
<style type="text/css" media="print">

	@media print
	{
	   @page {
		 margin-top:0px; 
		 margin-bottom:0px;
		 margin-left: 0px;
		 margin-right:0px;
		 padding-top: 0;
		 padding-bottom:0;
		 padding-left: 0;
		 padding-right: 0;
		 
	   }
	   
	.table td,
    .table th {
        background-color: transparent !important;
        -webkit-print-color-adjust: exact !important;
		border:1px solid rgb(0, 0, 0)!important;

    }
	.table th.tb-head{
	background-color: #cecece !important;
        -webkit-print-color-adjust: exact !important;
	
 }
 	.table td.tb-head{
	background-color: #cecece !important;
        -webkit-print-color-adjust: exact !important;
	
 }
	   
	} 

	
	#footer {
  position: fixed;
  bottom: 100px;
  width: 100%;
  padding-left: 30px
}
#details {
  position: fixed;
  top: 378px;
  width: 100%;
  padding-left: 30px
}
#headr {
  position: fixed;
  top: 200px;
  width: 100%;
  padding-left: 30px
}

body  {
		 padding-top: 0px;
		 padding-bottom:0;
		 padding-left: 0px;
		 padding-right: 0px;
		 
	   
	   }

	   .back {
    
    
    position: relative;
    
}
	   .back img {
    
    
    width:100%;
    height: 1120px;
    
}
</style>

<!-- business information here -->
<div class="back">
	<img src="../../img/Benq.png"  width=100" height="100"></img>
</div>

<div class="row" id="headr">

  <!-- Logo -->
  @if(!empty($receipt_details->logo))
	  <img style="max-height: 120px; width: auto;" src="{{$receipt_details->logo}}" class="img img-responsive center-block">
  @endif

  <!-- Header text -->
  @if(!empty($receipt_details->header_text))
	  <div class="col-xs-12">
		  {!! $receipt_details->header_text !!}
		  
	  </div>
  @endif
  
  <!-- business information here -->
  <div class="col-xs-12 text-center" >
	  

	  <!-- Address -->
	  
	  
	 
	  <p>
	  @if(!empty($receipt_details->tax_info1))
		  <b>{{ $receipt_details->tax_label1 }}</b> {{ $receipt_details->tax_info1 }}
	  @endif

	  @if(!empty($receipt_details->tax_info2))
		  <b>{{ $receipt_details->tax_label2 }}</b> {{ $receipt_details->tax_info2 }}
	  @endif
	  </p>

	  <!-- Title of receipt -->
	  @if(!empty($receipt_details->invoice_heading))
		  <h2 class="text-right">
			  {!! $receipt_details->invoice_heading !!}
		  </h2>
	  @endif

	  <!-- Invoice  number, Date  -->
	  <p style="width: 100% !important" class="word-wrap">
		  <span class="pull-left text-left ">
			  

			 

			 
			<table class="table table-bordered" align="left" style="width:250px;">
				<tbody>
				  <tr>
					<th class="text-center">@if(!empty($receipt_details->customer_name))
						<b>{{ $receipt_details->customer_label }}</b>
					@endif</th>
					<td class="text-center">@if(!empty($receipt_details->customer_name))
						{{$receipt_details->customer_name ?? ''}} @endif</td>
					
				  </tr>
				  @if(!empty($receipt_details->shipping_details))
				  <tr>
					
					<th class="text-center">@if(!empty($receipt_details->shipping_address))
						<b>Delivery<br>Address</b>
					@endif</th>
					<td class="text-center">@if(!empty($receipt_details->shipping_address))
						<p>{{$receipt_details->shipping_address}}<p>
					@endif</td>
					
				  </tr>
				  @endif
				  
				</tbody>
			  </table>
			
			
			  
		  </span>

		  <span class="pull-right text-left">
			<table class="table table-bordered" align="right" style="width:250px;">
				<tbody>
				  <tr>
					<th class="text-center">@if(!empty($receipt_details->invoice_no_prefix))
						<b>{!! $receipt_details->invoice_no_prefix !!}</b>
					@endif</th>
					<td class="text-center">{{$receipt_details->invoice_no}}</td>
					
				  </tr>
				  <tr>
					<th class="text-center">{{$receipt_details->date_label}}</th>
					<td class="text-center">{{$receipt_details->invoice_date}}</td>
					
				  </tr>
				  <tr>
					@if(!empty($receipt_details->payments))
					@foreach($receipt_details->payments as $payment)
					   
					<th class="text-center">Terms</th> <td class="text-center">{{$payment['method']}}</td>
						   
							
						
					@endforeach
				@endif
					
					
				  </tr>
				  
				</tbody>
			  </table>
			  
			  
			  @if(!empty($receipt_details->brand_label) || !empty($receipt_details->repair_brand))
				  <br>
				  @if(!empty($receipt_details->brand_label))
					  <b>{!! $receipt_details->brand_label !!}</b>
				  @endif
				  {{$receipt_details->repair_brand}}
			  @endif


			  @if(!empty($receipt_details->device_label) || !empty($receipt_details->repair_device))
				  <br>
				  @if(!empty($receipt_details->device_label))
					  <b>{!! $receipt_details->device_label !!}</b>
				  @endif
				  {{$receipt_details->repair_device}}
			  @endif

			  @if(!empty($receipt_details->model_no_label) || !empty($receipt_details->repair_model_no))
				  <br>
				  @if(!empty($receipt_details->model_no_label))
					  <b>{!! $receipt_details->model_no_label !!}</b>
				  @endif
				  {{$receipt_details->repair_model_no}}
			  @endif

			  @if(!empty($receipt_details->serial_no_label) || !empty($receipt_details->repair_serial_no))
				  <br>
				  @if(!empty($receipt_details->serial_no_label))
					  <b>{!! $receipt_details->serial_no_label !!}</b>
				  @endif
				  {{$receipt_details->repair_serial_no}}<br>
			  @endif
			  @if(!empty($receipt_details->repair_status_label) || !empty($receipt_details->repair_status))
				  @if(!empty($receipt_details->repair_status_label))
					  <b>{!! $receipt_details->repair_status_label !!}</b>
				  @endif
				  {{$receipt_details->repair_status}}<br>
			  @endif
			  
			  @if(!empty($receipt_details->repair_warranty_label) || !empty($receipt_details->repair_warranty))
				  @if(!empty($receipt_details->repair_warranty_label))
					  <b>{!! $receipt_details->repair_warranty_label !!}</b>
				  @endif
				  {{$receipt_details->repair_warranty}}
				  <br>
			  @endif
			  
			  <!-- Waiter info -->
			  @if(!empty($receipt_details->service_staff_label) || !empty($receipt_details->service_staff))
				  <br/>
				  @if(!empty($receipt_details->service_staff_label))
					  <b>{!! $receipt_details->service_staff_label !!}</b>
				  @endif
				  {{$receipt_details->service_staff}}
			  @endif
			  @if(!empty($receipt_details->shipping_custom_field_1_label))
				  <br><strong>{!!$receipt_details->shipping_custom_field_1_label!!} :</strong> {!!$receipt_details->shipping_custom_field_1_value ?? ''!!}
			  @endif

			  @if(!empty($receipt_details->shipping_custom_field_2_label))
				  <br><strong>{!!$receipt_details->shipping_custom_field_2_label!!}:</strong> {!!$receipt_details->shipping_custom_field_2_value ?? ''!!}
			  @endif

			  @if(!empty($receipt_details->shipping_custom_field_3_label))
				  <br><strong>{!!$receipt_details->shipping_custom_field_3_label!!}:</strong> {!!$receipt_details->shipping_custom_field_3_value ?? ''!!}
			  @endif

			  @if(!empty($receipt_details->shipping_custom_field_4_label))
				  <br><strong>{!!$receipt_details->shipping_custom_field_4_label!!}:</strong> {!!$receipt_details->shipping_custom_field_4_value ?? ''!!}
			  @endif

			  @if(!empty($receipt_details->shipping_custom_field_5_label))
				  <br><strong>{!!$receipt_details->shipping_custom_field_2_label!!}:</strong> {!!$receipt_details->shipping_custom_field_5_value ?? ''!!}
			  @endif
			  {{-- sale order --}}
			  @if(!empty($receipt_details->sale_orders_invoice_no))
				  <br>
				  <strong>@lang('restaurant.order_no'):</strong> {!!$receipt_details->sale_orders_invoice_no ?? ''!!}
			  @endif

			  @if(!empty($receipt_details->sale_orders_invoice_date))
				  <br>
				  <strong>@lang('lang_v1.order_dates'):</strong> {!!$receipt_details->sale_orders_invoice_date ?? ''!!}
			  @endif
		  </span>
	  </p>
	  
  </div>
</div>

<div class="row">
  @includeIf('sale_pos.receipts.partial.common_repair_invoice')
</div>

<div class="row" id="details">
  <div class="col-xs-12">
	  <br/>
	  @php
		  $p_width = 48;
	  @endphp
	  @if(!empty($receipt_details->item_discount_label))
		  @php
			  $p_width -= 15;
		  @endphp
	  @endif
	  <table class="table table-bordered" >
		  <thead>
			  <tr>
				  <th  class="text-center tb-head" width="3%">Item</th>
				  <th  width="{{$p_width}}%" class="text-center tb-head">{{$receipt_details->table_product_label}}</th>
				  <th class="text-center tb-head" width="15%">Warrenty</th>
				  <th class="text-center tb-head" width="15%">{{$receipt_details->table_qty_label}}</th>
				  <th class="text-center tb-head" width="15%">{{$receipt_details->table_unit_price_label}}</th>
				  @if(!empty($receipt_details->item_discount_label))
					  <th class="text-center" width="15%">{{$receipt_details->item_discount_label}}</th>
				  @endif
				  <th class="text-center tb-head" width="15%">{{$receipt_details->table_subtotal_label}}</th>
			  </tr>
		  </thead>
		  <tbody>
			<?php $i=1 ?>
			  @forelse($receipt_details->lines as $line)
			  
				  <tr >
					<td class="text-center"><?php echo $i;?></td>
					  <td class="text-center">
						  @if(!empty($line['image']))
							  <img src="{{$line['image']}}" alt="Image" width="50" style="float: left; margin-right: 8px;">
						  @endif
						  {{$line['name']}} {{$line['product_variation']}} {{$line['variation']}} 
						  @if(!empty($line['sub_sku'])), {{$line['sub_sku']}} @endif @if(!empty($line['brand'])), {{$line['brand']}} @endif @if(!empty($line['cat_code'])), {{$line['cat_code']}}@endif
						  @if(!empty($line['product_custom_fields'])), {{$line['product_custom_fields']}} @endif
						  @if(!empty($line['sell_line_note']))
						  <br>
						  <small>
							  {{$line['sell_line_note']}}
						  </small>
						  @endif 
						  @if(!empty($line['lot_number']))<br> {{$line['lot_number_label']}}:  {{$line['lot_number']}} @endif 
						  @if(!empty($line['product_expiry'])), {{$line['product_expiry_label']}}:  {{$line['product_expiry']}} @endif

						 
						  @if(!empty($line['warranty_description'])) <small> {{$line['warranty_description'] ?? ''}}</small>@endif
					  </td>
					  <?php $i++ ?> 
					  <td class="text-center"> @if(!empty($line['warranty_name'])){{$line['warranty_name']}} @endif @if(!empty($line['warranty_exp_date'])) <small>- {{@format_date($line['warranty_exp_date'])}} </small>@endif</td>
					  <td class="text-center">{{$line['quantity']}} {{$line['units']}} </td>
					  <td class="text-center">{{$line['unit_price_before_discount']}}</td>
					  @if(!empty($receipt_details->item_discount_label))
						  <td class="text-center">
							  {{$line['line_discount'] ?? '0.00'}}
						  </td>
					  @endif
					  <td class="text-center">{{$line['line_total']}}</td>
				  </tr>
				  @if(!empty($line['modifiers']))
					  @foreach($line['modifiers'] as $modifier)
						  <tr>
							  <td>
								  {{$modifier['name']}} {{$modifier['variation']}} 
								  @if(!empty($modifier['sub_sku'])), {{$modifier['sub_sku']}} @endif @if(!empty($modifier['cat_code'])), {{$modifier['cat_code']}}@endif
								  @if(!empty($modifier['sell_line_note']))({{$modifier['sell_line_note']}}) @endif 
							  </td>
							  <td class="text-center">{{$modifier['quantity']}} {{$modifier['units']}} </td>
							  <td class="text-center">{{$modifier['unit_price_inc_tax']}}</td>
							  @if(!empty($receipt_details->item_discount_label))
								  <td class="text-center">0.00</td>
							  @endif
							  <td class="text-center">{{$modifier['line_total']}}</td>
						  </tr>
					  @endforeach
				  @endif
			  @empty
				  <tr>
					  <td colspan="4">&nbsp;</td>
				  </tr>
				  
			  @endforelse
		  </tbody>
	  </table>
  </div>
</div>

<div class="row" id="footer">
  
  <div class="col-xs-12">

	  <table class="table table-bordered">

		  

		  <!-- Total Paid-->
		 

		  <!-- Total Due-->
		  @if(!empty($receipt_details->total_due))
		  <tr class="tb-head">
			  <th >
				  {!! $receipt_details->total_due_label !!}
			  </th>
			  <td class="text-center">
				  {{$receipt_details->total_due}}
			  </td>
		  </tr>
		  @endif

		  @if(!empty($receipt_details->all_due))
		  <tr class="tb-head">
			  <th>
				  {!! $receipt_details->all_bal_label !!}
			  </th>
			  <td class="text-center">
				  {{$receipt_details->all_due}}
			  </td>
		  </tr>
		  @endif
	  </table>
  </div>
  
  <div class="col-xs-12">
	  <div class="table-responsive">
			<table class="table table-bordered">
			  <tbody>
				  @if(!empty($receipt_details->total_quantity_label))
					  <tr>
						  <th style="width:85%" class="tb-head">
							  {!! $receipt_details->total_quantity_label !!}
						  </th>
						  <td class="text-right">
							  {{$receipt_details->total_quantity}}
						  </td>
					  </tr>
				  @endif
				  <tr>
					  <th style="width:85%" class="tb-head">
						  {!! $receipt_details->subtotal_label !!}
					  </th>
					  <td class="text-center tb-head">
						  {{$receipt_details->subtotal}}
					  </td>
				  </tr>
				  @if(!empty($receipt_details->total_exempt_uf))
				  <tr>
					  <th style="width:85%" class="tb-head">
						  @lang('lang_v1.exempt')
					  </th>
					  <td class="text-center tb-head">
						  {{$receipt_details->total_exempt}}
					  </td>
				  </tr>
				  @endif
				  <!-- Shipping Charges -->
				  @if(!empty($receipt_details->shipping_charges))
					  <tr>
						  <th style="width:85%" class="tb-head">
							  {!! $receipt_details->shipping_charges_label !!}
						  </th>
						  <td class="text-center tb-head">
							  {{$receipt_details->shipping_charges}}
						  </td>
					  </tr>
				  @endif

				  @if(!empty($receipt_details->packing_charge))
					  <tr>
						  <th style="width:85%" class="tb-head">
							Service Fee
						  </th>
						  <td class="text-center tb-head">
							  {{$receipt_details->packing_charge}}
						  </td>
					  </tr>
				  @endif

				  <!-- Discount -->
				  @if( !empty($receipt_details->discount) )
					  <tr>
						  <th class="tb-head">
							  {!! $receipt_details->discount_label !!}
						  </th>

						  <td class="text-center tb-head">
							  (-) {{$receipt_details->discount}}
						  </td>
					  </tr>
				  @endif

				 

				  @if( !empty($receipt_details->reward_point_label) )
					  <tr>
						  <th class="tb-head">
							  {!! $receipt_details->reward_point_label !!}
						  </th>

						  <td class="text-center tb-head">
							  (-) {{$receipt_details->reward_point_amount}}
						  </td>
					  </tr>
				  @endif

				  <!-- Tax -->
				  @if( !empty($receipt_details->tax) )
					  <tr>
						  <th class="tb-head">
							  {!! $receipt_details->tax_label !!}
						  </th>
						  <td class="text-center tb-head">
							  (+) {{$receipt_details->tax}}
						  </td>
					  </tr>
				  @endif

				  @if( $receipt_details->round_off_amount > 0)
					  <tr>
						  <th class="tb-head">
							  {!! $receipt_details->round_off_label !!}
						  </th>
						  <td class="text-center tb-head">
							  {{$receipt_details->round_off}}
						  </td>
					  </tr>
				  @endif

				  <!-- Total -->
				  <tr>
					  <th class="tb-head">
						  {!! $receipt_details->total_label !!}
					  </th>
					  <td class="text-center tb-head">
						  {{$receipt_details->total}}
						  @if(!empty($receipt_details->total_in_words))
							  <br>
							  <small>({{$receipt_details->total_in_words}})</small>
						  @endif
					  </td>
				  </tr>
			  </tbody>
		  </table>
	  </div>
  </div>
  
  <div class="col-xs-12">
	  <p>{!! nl2br($receipt_details->additional_notes) !!}</p>
	  
  </div>
  
  
</div>
</div>