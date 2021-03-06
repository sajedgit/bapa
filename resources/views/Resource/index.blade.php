

@extends('parent')

@section('main')

<!-- Page Heading -->
<h1 class="h3 mb-2 text-gray-800">{{ __('resource.page_title') }}</h1>
<p class="mb-4">{{ __('resource.welcome_msg') }}</p>

<div align="right">
	<a href="{{ route('resource.create') }}" class="btn btn-success btn-sm">{{ __('resource.create') }}</a>
</div>
<br />
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
              <h6 class="m-0 font-weight-bold text-primary">{{ __('resource.page_name') }}</h6>
            </div>
            <div class="card-body">
              <div class="table-responsive">
                <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                  <thead>
                    <tr>
                        <th>{{ __('resource.resource_name') }}</th>
						 <th>{{ __('resource.slug') }}</th>
						 <th>{{ __('resource.about_content') }}</th>
						 <th>{{ __('resource.sort_order') }}</th>




                      <th>Action</th>
                    </tr>
                  </thead>
                  <tfoot>
                    <tr>
                       <th>{{ __('resource.resource_name') }}</th>
						 <th>{{ __('resource.slug') }}</th>
						 <th>{{ __('resource.about_content') }}</th>
						 <th>{{ __('resource.sort_order') }}</th>



                      <th>Action</th>
                    </tr>
                  </tfoot>
                  <tbody>
				   @foreach($data as $row)
                    <tr>

					    <td>{{ $row->resource_name }}</td>
						 <td>{{ $row->slug }}</td>
						 <td><?php echo  $row->about_content; ?></td>

						 <td>{{ $row->sort_order }}</td>



                       <td class="text-center">
					  {{ Form::open([ 'method'  => 'delete', 'route' => [ 'resource.destroy', $row->id ] ]) }}

							<a href="{{ route('resource.show', $row->id) }}" class="btn btn-primary">Show</a>
							<a href="{{ route('resource.edit', $row->id) }}" class="btn btn-warning">Edit</a>
							@csrf
							@method('DELETE')
							<button type="submit"  onclick="return confirm('Are you sure you want to delete this item?');" class="btn btn-danger">Delete</button>
					  {{ Form::close() }}

					   </td>

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

