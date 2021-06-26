


@extends('parent')

@section('main')

    <!-- Page Heading -->
    <h1 class="h3 mb-2 text-gray-800 ">Import Ess Member</h1>

    <div align="right">
        <a href="{{ route('ess_members.create') }}" class="btn btn-success btn-sm">Create Ess Member</a>

    </div>
    <br />
    @if ($message = Session::get('success'))
        <div class="alert alert-success">
            <p>{{ $message }}</p>
        </div>
    @endif


    <!-- Begin Page Content -->
    <div class="container-fluid">


        <div class="container">

            <div class="card bg-light mt-3">

                <div class="card-header">

                    Import Excel to database

                </div>

                <div class="card-body">

                    <form action="{{ route('import') }}" method="POST" enctype="multipart/form-data">

                        @csrf

                        <input type="file" name="file" class="form-control">

                        <br>

                        <button class="btn btn-success">Import Ess Data</button>

{{--                        <a class="btn btn-warning" href="{{ route('export') }}">Export User Data</a>--}}

                    </form>

                </div>

            </div>

        </div>

    </div>
    <!-- /.container-fluid -->


@endsection



