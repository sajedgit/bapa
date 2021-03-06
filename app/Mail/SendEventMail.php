<?php

namespace App\Mail;

use Illuminate\Bus\Queueable;
use Illuminate\Mail\Mailable;
use Illuminate\Queue\SerializesModels;
use Illuminate\Contracts\Queue\ShouldQueue;

class SendEventMail extends Mailable
{
    use Queueable, SerializesModels;
    public $action,$event_name,$subject,$user_name, $order_id, $source, $payment_type,$details,$total_tickets,$net_amounts;

    /**
     * Create a new message instance.
     *
     * @return void
     */
    public function __construct($action,$event_name,$subject,$user_name, $order_id, $source, $payment_type,$details,$total_tickets,$net_amounts)
    {

        $this->action = $action;
        $this->event_name = $event_name;
        $this->subject = $subject;
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
      return $this->from( "nypdbapa@gmail.com","BAPA")
            ->subject($this->subject)
            ->view('emails.buy_tickets');
    }
}