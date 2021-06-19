

@extends('parent')

@section('main')

    <!-- Page Heading -->

    <p class="mb-4">{{ __('events.welcome_msg') }}</p>
    <h1 class="h3 mb-2 text-gray-800">{{ $events->event_title }}</h1>

    <p>
        <span>Event Date: {{ $events->event_starting_date }}</span>

    </p>
    <p>

        <span>Event Vanue: {{ $events->event_venue }}</span>
    </p>


    @if ($message = Session::get('success'))
        <div class="alert alert-success">
            <p>{{ $message }}</p>
        </div>
    @endif


    <!-- Begin Page Content -->
    <div class="container-fluid">

        <!-- DataTales Example -->
        <div class="card shadow mb-4">
            <div class="card-header py-3">
                <h6 class="m-0 font-weight-bold text-primary">{{ __('events.page_name') }}</h6>
            </div>
            <div class="card-body">
                <div class="table-responsive">
                    <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                        <thead>
                        <tr>
                            <th>Name</th>
                            <th>Email</th>
                            <th>Adult</th>
                            <th>Kids</th>
                            <th>Details</th>
                            <th>Total Tickets</th>
                            <th>Total Price</th>

                        </tr>
                        </thead>
                        <tfoot>
                        <tr>
                            <th>Name</th>
                            <th>Email</th>
                            <th>Adult</th>
                            <th>Kids</th>
                            <th>Details</th>
                            <th>Total Tickets</th>
                            <th>Total Price</th>

                        </tr>
                        </tfoot>
                        <tbody>
                        @foreach($data as $row)
                            <tr>

                                <td>{{ $row->name }}</td>
                                <td>{{ $row->email }}</td>
                                <td>{{ $row->adult_ticket }}</td>
                                <td>{{ $row->children_ticket }}</td>
                                <td>{{ $row->details }}</td>
                                <td>{{ $row->total_tickets }}</td>
                                <td>{{ $row->total_price }}</td>


                            </tr>
                        @endforeach

                        </tbody>
                    </table>
                </div>
            </div>
        </div>

    </div>
    <!-- /.container-fluid -->



@endsection

