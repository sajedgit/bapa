@extends('parent')

@section('main')

<!-- Page Heading -->
<h1 class="h3 mb-2 text-gray-800">{{ __('resource.page_title') }}</h1>
<p class="mb-4">{{ __('resource.welcome_msg') }}</p>


 <div align="right">
  <a href="{{ route('resource.index') }}" class="btn btn-default">Back</a>
 </div>
 <br />

 <table class="table table-striped">
        <thead >
        <tr class="info">

            <th scope="col">Column</th>
            <th scope="col">Value</th>
        </tr>
        </thead>
        <tbody>
		<tr>
			<td>{{ __('resource.resource_name') }}</td>
 			<td>{{ $data->resource_name }} </td>

		</tr>
		<tr>
			<td>{{ __('resource.slug') }}</td>
 			<td>{{ $data->slug }} </td>

		</tr>
		<tr>
			<td>{{ __('resource.about_content') }}</td>
 			<td>  <?php echo  $data->about_content; ?></td>

		</tr>
		<tr>
			<td>sort_order</td>
 			<td>{{ $data->sort_order }} </td>

		</tr>

		</tbody>
</table>


@endsection
