
@extends('parent')

@section('main')

            @if ($errors->any())
                <div class="alert alert-danger">
                    <ul>
                        @foreach ($errors->all() as $error)
                            <li>{{ $error }}</li>
                        @endforeach
                    </ul>
                </div>
            @endif

			<!-- Page Heading -->
			<h1 class="h3 mb-2 text-gray-800">{{ __('resource.page_title') }}</h1>
			<p class="mb-4">{{ __('resource.welcome_msg') }}</p>

            <div align="right">
                <a href="{{ route('resource.index') }}" class="btn btn-default">Back</a>
            </div>
            <br />

			@include('partials.tinymce_editor')

			{{ Form::open([ 'method'  => 'post','class'  => 'col-sm-12', 'files'=>'true','route' => [ 'resource.update', $data->id ] ]) }}

				 @csrf
                @method('PATCH')





			<div class="form-group row">
				<div class="col-sm-2 mb-3 mb-sm-0">
					{{ Form::label('resource_name', (Lang::get('resource.enter_msg').' '.Lang::get('resource.resource_name')),array('class'=>'control-label')) }}
				</div>
				<div class="col-sm-6">
					{{ Form::text('resource_name', $value = $data->resource_name ,array('class' => 'form-control','placeholder'=>Lang::get('resource.resource_name'))) }}
				</div>
			</div>



			<div class="form-group row">
				<div class="col-sm-2 mb-3 mb-sm-0">
					{{ Form::label('about_content', (Lang::get('resource.enter_msg').' '.Lang::get('resource.about_content')),array('class'=>'control-label')) }}
				</div>
				<div class="col-sm-10">
					{{ Form::textArea('about_content', $value = $data->about_content ,array('class' => 'form-control','cols' => '100','rows' => '20','placeholder'=>Lang::get('resource.about_content'))) }}
				</div>
			</div>


			<div class="form-group row">
				<div class="col-sm-2 mb-3 mb-sm-0">
					{{ Form::label('sort_order', (Lang::get('resource.enter_msg').' '.Lang::get('resource.sort_order')),array('class'=>'control-label')) }}
				</div>
				<div class="col-sm-2">
					{{ Form::number('sort_order', $value = $data->sort_order ,array('class' => 'form-control','placeholder'=>Lang::get('resource.sort_order'))) }}
				</div>
			</div>








			<br />



				<div class="form-group">
				<label class="control-label ">&nbsp;&nbsp;</label>
				{{ Form::submit(Lang::get('resource.update_btn_msg'), array('class' => 'btn btn-primary')) }}
				</div>

			{!! Form::close() !!}

@endsection
