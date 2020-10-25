<?php

namespace App\Mail;

use Illuminate\Bus\Queueable;
use Illuminate\Mail\Mailable;
use Illuminate\Queue\SerializesModels;
use Illuminate\Contracts\Queue\ShouldQueue;

class SendEventMail extends Mailable
{
    use Queueable, SerializesModels;
    public $event_name,$user_name, $order_id, $source, $payment_type,$details,$total_tickets,$net_amounts;

    /**
     * Create a new message instance.
     *
     * @return void
     */
    public function __construct($event_name,$user_name, $order_id, $source, $payment_type,$details,$total_tickets,$net_amounts)
    {
        $this->event_name = $event_name;
        $this->user_name = $user_name;
        $this->order_id = $order_id;
        $this->source = $source;
        $this->payment_type = $payment_type;
        $this->details = $details;
        $this->total_tickets = $total_tickets;
        $this->net_amounts = $net_amounts; 


    }

    /**
     * Build the message.
     *
     * @return $this
     */
    public function build()
    {
        //return $this->view('emails.name');
      return $this->from( $this->event_name,$this->user_name,$this->order_id,$this->source,$this->payment_type,$this->details,$this->total_tickets,$this->net_amounts)
            ->subject("Buying Ticket Order Confirmation")
            ->view('emails.buy_tickets');
    }
}