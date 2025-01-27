@extends('admin.layouts.app')

@section('content')
    <section class="section">
        <div class="section-header">
            <h1>{{ $pageTitle }}</h1>
            <div class="section-header-breadcrumb">
                <div class="breadcrumb-item active"><a href="{{ getAdminPanelUrl() }}">{{ trans('admin/main.dashboard') }}</a></div>
                <div class="breadcrumb-item">{{ trans('admin/main.certificate_requests') }}</div>
            </div>
        </div>

        <div class="section-body">
            <div class="row">
                <div class="col-12">
                    <div class="card">
                        <div class="card-header">
                            <h4>{{ trans('admin/main.certificate_requests_list') }}</h4>
                        </div>
                        <div class="card-body">
                            <form method="GET" action="" class="mb-4">
                                <div class="row">
                                    <div class="col-12 col-md-4">
                                        <div class="form-group">
                                            <label class="input-label">{{ trans('admin/main.instructor') }}</label>
                                            <select name="teacher_ids[]" multiple="multiple" data-search-option="just_teacher_role" class="form-control search-user-select2"
                                                    data-placeholder="Search teachers">

                                                @if(!empty($teachers) and $teachers->count() > 0)
                                                    @foreach($teachers as $teacher)
                                                        <option value="{{ $teacher->id }}" selected>{{ $teacher->full_name }}</option>
                                                    @endforeach
                                                @endif
                                            </select>
                                        </div>
                                    </div>

                                    <div class="col-12 col-md-4">
                                        <div class="form-group">
                                            <label class="input-label d-block">{{ trans('admin/main.class') }}</label>
                                            <select name="webinars_ids[]" multiple="multiple" class="form-control search-webinar-select2"
                                                    data-placeholder="{{ trans('admin/main.search_webinar') }}">
                                                @if(!empty($webinars))
                                                    @foreach($webinars as $webinar)
                                                        <option value="{{ $webinar->id }}"
                                                                selected="selected">{{ $webinar ? $webinar->title : ''}}</option>
                                                    @endforeach
                                                @endif
                                            </select>
                                        </div>
                                    </div>

                                    <div class="col-12 col-md-4 d-flex align-items-center justify-content-end">
                                        <button type="submit" class="btn btn-primary w-100">{{ trans('public.show_results') }}</button>
                                    </div>
                                </div>
                            </form>

                            <div class="table-responsive">
                                <table class="table table-striped font-14">
                                    <thead>
                                        <tr>
                                            <th>{{ trans('admin/main.instructor') }}</th>
                                            <th>{{ trans('admin/main.webinar') }}</th>
                                            <th>{{ trans('admin/main.status') }}</th>
                                            <th>{{ trans('admin/main.created_at') }}</th>
                                            <th>{{ trans('admin/main.actions') }}</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        @if($certificate_requests->count() > 0)
                                            @foreach($certificate_requests as $certificateRequest)
                                                <tr>
                                                    <td>{{ $certificateRequest->instructor->full_name ?? '-' }}</td>
                                                        @if(!empty($certificateRequest->webinar->slug))
                                                            <td>{{ $certificateRequest->webinar->slug }}</td>
                                                        @else
                                                            <td>-</td>
                                                        @endif
                                                        <td>
                                                        @if($certificateRequest->status ===  \App\Models\CertificateRequest::$done)
                                                            <span class="text-primary">{{ trans('admin/main.accepted') }}</span>
                                                        @elseif($certificateRequest->status ===  \App\Models\CertificateRequest::$reject)
                                                            <span class="text-danger">{{ trans('admin/main.rejected') }}</span>
                                                        @else
                                                            <span class="text-warning">{{ trans('admin/main.pending') }}</span>
                                                        @endif
                                                    </td>
                                                    <td>{{ dateTimeFormat($certificateRequest->created_at, 'j M Y H:i') }}</td>

                                                    <td>
                                                        @include('admin.includes.delete_button', [
                                                            'url' => getAdminPanelUrl().'/certificates/certificate-requests/'. $certificateRequest->id .'/approve',
                                                            'tooltip' => trans('admin/main.approve'),
                                                            'btnIcon' => 'fa-check'
                                                        ])
                                                        @include('admin.includes.delete_button', [
                                                            'url' => getAdminPanelUrl().'/certificates/certificate-requests/'. $certificateRequest->id .'/reject',
                                                            'tooltip' => trans('public.reject'),
                                                            'btnIcon' => 'fa-times-circle',
                                                            'btnClass' => 'ml-2',
                                                        ])
                                                    </td>
                                                </tr>
                                            @endforeach
                                        @endif
                                    </tbody>
                                </table>
                            </div>
                        </div>
                        <div class="card-footer text-center">
                            {{ $certificate_requests->appends(request()->input())->links() }}
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
@endsection
