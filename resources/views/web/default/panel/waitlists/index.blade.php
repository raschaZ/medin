@extends(getTemplate() .'.panel.layouts.panel_layout')
@push('styles_top')
    <link rel="stylesheet" href="/assets/vendors/fontawesome/css/all.min.css">
@endpush
@section('content')
    <section class="section">
        <div class="section-header">
            <h1>{{trans('update.waitlists')}}</h1>
            {{-- <div class="section-header-breadcrumb">
                <div class="breadcrumb-item active"><a href="/panel">{{trans('admin/main.dashboard')}}</a>
                </div>
                <div class="breadcrumb-item">{{trans('update.waitlists')}}</div>
            </div> --}}
        </div>

        <div class="section-body">


            <div class="card">
                <div class="card-header">
                    @can('panel_webinars_create')
                    <a href="/panel/waitlists/export" class="btn btn-primary">{{ trans('admin/main.export_xls') }}</a>
                    @endcan
                </div>
                <div class="card-body">
                    <table class="table table-striped font-14" id="datatable-details">
                        <thead>
                        <tr>
                            <th class="text-left">{{ trans('admin/main.course') }}</th>
                            <th>{{ trans('update.members') }}</th>
                            <th>{{ trans('update.registered_members') }}</th>
                            <th>{{ trans('update.last_submission') }}</th>
                            <th>{{ trans('admin/main.actions') }}</th>
                        </tr>
                        </thead>

                        <tbody>
                        @foreach($waitlists as $waitlist)
                            <tr>
                                <td class="text-left">
                                    <a class="text-primary mt-0 mb-1 font-weight-bold" href="{{ $waitlist->getUrl() }}">{{ $waitlist->title }}</a>
                                    @if(!empty($waitlist->category->title))
                                        <div class="text-small">{{ $waitlist->category->title }}</div>
                                    @else
                                        <div class="text-small text-warning">{{trans('admin/main.no_category')}}</div>
                                    @endif
                                </td>

                                <td class="text-left">{{ $waitlist->members }}</td>

                                <td class="text-left">{{ $waitlist->registered_members }}</td>

                                <td class="text-left">
                                    {{ !empty($waitlist->last_submission) ? dateTimeFormat($waitlist->last_submission, 'j M Y H:i') : '-' }}
                                </td>

                                <td>
                                    <div class="btn-group dropdown table-actions">
                                        <button type="button" class="btn-transparent dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                            <i class="fa fa-ellipsis-v"></i>
                                        </button>
                                        <div class="dropdown-menu webinars-lists-dropdown">
                                            @can('panel_webinars_create')
                                                <a href="/panel/waitlists/{{$waitlist->id}}/clear_list" class="d-flex align-items-center text-warning text-decoration-none btn-transparent btn-sm mt-1">
                                                    <i class="fa fa-times danger"></i>
                                                    <span class="ml-2">{{ trans("update.clear_list") }}</span>
                                                </a>
                                            @endcan

                                            @can('panel_webinars_create')
                                                <a href="/panel/waitlists/{{$waitlist->id}}/view_list" class="d-flex align-items-center text-dark text-decoration-none btn-transparent btn-sm mt-1">
                                                    <i class="fa fa-eye"></i>
                                                    <span class="ml-2">{{ trans("update.view_list") }}</span>
                                                </a>
                                            @endcan

                                            @can('panel_webinars_create')
                                                <a href="/panel/waitlists/{{$waitlist->id}}/export_list" class="d-flex align-items-center text-dark text-decoration-none btn-transparent btn-sm mt-1">
                                                    <i class="fa fa-download"></i>
                                                    <span class="ml-2">{{ trans("update.export_list") }}</span>
                                                </a>
                                            @endcan

                                            @can('panel_webinars_create')
                                                <a href="/panel/waitlists/{{$waitlist->id}}/disable" class="d-flex align-items-center text-danger text-decoration-none btn-transparent btn-sm mt-1">
                                                    <i class="fa fa-lock"></i>
                                                    <span class="ml-2">{{ trans("update.disable_waitlist") }}</span>
                                                </a>
                                            @endcan
                                        </div>
                                    </div>
                                </td>
                            </tr>
                        @endforeach
                        </tbody>

                    </table>
                </div>

                <div class="card-footer text-center">
                    {{ $waitlists->appends(request()->input())->links() }}
                </div>
            </div>
        </div>
    </section>
@endsection
