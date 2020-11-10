<div>
    <p>Hi Mr/Mrs {{ $user_name }},<br/> Your purchase have been successfully done for  Event</p>
     @if($order_id)
     <p>Your order id is : {{ $order_id }}</p>
     @endif
    <p>Payment type: {{ $payment_type }}</p>
    <p>Order details:  {{ $details }}</p>
    <p>Total Tickets: {{ $total_tickets }}</p>
    <p>Total amount: {{ $net_amounts }}</p>

</div>

