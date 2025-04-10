@extends(getTemplate() .'.panel.layouts.panel_layout')

@push('styles_top')
    <link rel="stylesheet" href="/assets/vendors/fontawesome/css/all.min.css">
    <link rel="stylesheet" href="/assets/default/vendors/select2/select2.min.css">
@endpush


@section('content')
    <section class="section">
        <div class="section-header mb-2">
            <h1>{{ $pageTitle }}</h1>
        </div>

        <div class="section-body">
            <section class="card mb-2">
                <div class="card-body">
                    <form class="mb-0">
                        <div class="row">
                            <div class="col-md-4" >
                                <div class="form-group">
                                    <label class="input-label">{{ trans('admin/main.instructor') }}</label>
                                    <select name="teacher_ids[]" multiple="multiple" class="form-control select2" data-placeholder="{{ trans('public.search_instructors') }}">
                                        @if(!empty($teachers))
                                            @foreach($teachers as $teacher)
                                                <option value="{{ $teacher->id }}" 
                                                    @if(is_array(request()->get('teacher_ids')) && in_array($teacher->id, request()->get('teacher_ids'))) selected @endif>
                                                    {{ $teacher->full_name }}
                                                </option>
                                            @endforeach
                                        @endif
                                    </select>
                                </div>
                            </div>

                            <div class="col-md-4">
                                <div class="form-group">
                                    <label class="input-label">{{ trans('admin/main.class') }}</label>
                                    <select name="webinars_ids[]" multiple="multiple" class="form-control select2" data-placeholder="{{ trans('admin/main.search_webinar') }}">
                                        @if(!empty($webinars))
                                            @foreach($webinars as $webinar)
                                                <option value="{{ $webinar->id }}" 
                                                    @if(is_array(request()->get('webinars_ids')) && in_array($webinar->id, request()->get('webinars_ids'))) selected @endif>
                                                    {{ $webinar->title }}
                                                </option>
                                            @endforeach
                                        @endif
                                    </select>
                                </div>
                            </div>

                            <div class="col-md-4">
                                <div class="form-group">
                                    <label class="input-label">{{ trans('admin/main.status') }}</label>
                                    <select name="status" class="form-control">
                                        <option value="">{{ trans('admin/main.all_status') }}</option>
                                        <option value="done" @if(request()->get('status') == 'done') selected @endif>{{ trans('admin/main.accepted') }}</option>
                                        <option value="pending" @if(request()->get('status') == 'pending') selected @endif>{{ trans('admin/main.pending') }}</option>
                                        <option value="reject" @if(request()->get('status') == 'reject') selected @endif>{{ trans('admin/main.rejected') }}</option>
                                    </select>
                                </div>
                            </div>

                            <div class="col-md-2">
                                <div class="form-group">
                                    <label class="input-label mb-2"> </label>
                                    <input type="submit" class="btn btn-primary" value="{{ trans('admin/main.show_results') }}">
                                </div>
                            </div>
                        </div>
                    </form>
                </div>
            </section>

            <div class="row">
                <div class="col-12">
                    <div class="card">
                        <div class="card-body">
                            <div class="table-responsive">
                                <table class="table table-striped font-14">
                                    <thead>
                                        <tr>
                                            <th class="text-left">{{ trans('admin/main.instructor') }}</th>
                                            <th class="text-center">{{ trans('admin/main.webinar') }}</th>
                                            <th class="text-center">{{ trans('admin/main.status') }}</th>
                                            <th class="text-center">{{ trans('admin/main.list') }}</th>
                                            <th class="text-center">{{ trans('admin/main.created_at') }}</th>
                                            <th class="text-right">{{ trans('admin/main.actions') }}</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        @if($certificate_requests->count() > 0)
                                            @foreach($certificate_requests as $certificateRequest)
                                                <tr>
                                                    <td>{{ $certificateRequest->instructor->full_name ?? '-' }}</td>
                                                    <td class="text-center">{{ $certificateRequest->webinar->slug ?? '-' }}</td>
                                                    <td class="text-center">
                                                        @if($certificateRequest->status === \App\Models\CertificateRequest::$done)
                                                            <span class="text-primary">{{ trans('admin/main.accepted') }}</span>
                                                        @elseif($certificateRequest->status === \App\Models\CertificateRequest::$reject)
                                                            <span class="text-danger">{{ trans('admin/main.rejected') }}</span>
                                                        @else
                                                            <span class="text-warning">{{ trans('admin/main.pending') }}</span>
                                                        @endif
                                                    </td>
                                                    <td class="text-center align-middle">
                                                        @if(!empty($certificateRequest->teachersList))
                                                            <button class="btn btn-primary btn-sm view-list" 
                                                                    data-list="{{ json_encode($certificateRequest->teachersList->teachers) }}">
                                                                {{ trans('public.view') }}
                                                            </button>
                                                        @else
                                                            ---
                                                        @endif
                                                    </td>
                                                    <td class="text-center">{{ dateTimeFormat($certificateRequest->created_at, 'j M Y H:i') }}</td>
                                                    <td class="text-right">
                                                        @if($certificateRequest->status === \App\Models\CertificateRequest::$reject or $certificateRequest->status === \App\Models\CertificateRequest::$waiting)
                                                            <a href="/panel/certificates/certificate-requests/{{ $certificateRequest->id }}/approve" 
                                                            class="text-success-green ml-2" 
                                                            data-toggle="tooltip" 
                                                            title="{{ trans('admin/main.approve') }}">
                                                                <i class="fa fa-check"></i>
                                                            </a>
                                                        @endif
                                                        @if($certificateRequest->status === \App\Models\CertificateRequest::$done or $certificateRequest->status === \App\Models\CertificateRequest::$waiting)
                                                            <a href="/panel/certificates/certificate-requests/{{ $certificateRequest->id }}/reject" 
                                                            class="text-danger ml-2" 
                                                            data-toggle="tooltip" 
                                                            title="{{ trans('public.reject') }}">
                                                                <i class="fa fa-times-circle"></i>
                                                            </a>
                                                        @endif
                                                    </td>
                                                </tr>
                                            @endforeach
                                        @else
                                            <tr>
                                                <td colspan="6" class="text-center">{{ trans('public.show_results') }}</td>
                                            </tr>
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

    <!-- Modal Structure -->
    <div class="modal fade" id="listModal" tabindex="-1" role="dialog" aria-labelledby="listModalLabel" aria-hidden="true">
        <div class="modal-dialog modal-lg" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="listModalLabel">{{ trans('public.list') }}</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body" id="listModalContent">
                    <!-- Content will be dynamically added here -->
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">{{ trans('admin/main.close') }}</button>
                </div>
            </div>
        </div>
    </div>
@endsection

@push('scripts_bottom')
    <script src="/assets/admin/vendor/jquery/jquery-3.3.1.min.js"></script>
    <script src="/assets/admin/vendor/bootstrap/bootstrap.min.js"></script>
    <script src="/assets/default/vendors/select2/select2.min.js"></script>

    <script>
        $(document).ready(function () {
            
            $('.select2').select2({
                width: '100%',
                theme: 'default'
            });

            $('.view-list').on('click', function () {
                let listData = $(this).data('list');
                let modalContent = $('#listModalContent');

                if (Array.isArray(listData) && listData.length > 0) {
                    let html = '<table class="table"><thead><tr><th class="text-center">Name</th><th class="text-center">Email</th></tr></thead><tbody>';
                    listData.forEach(item => {
                        html += `<tr class="text-center"><td>${item.name}</td><td class="text-center">${item.email}</td></tr>`;
                    });
                    html += '</tbody></table>';
                    modalContent.html(html);
                } else {
                    modalContent.html('<p class="text-danger text-center">{{ trans("admin/main.no_data_found") }}</p>');
                }

                $('#listModal').modal('show');
            });
        });
    </script>
@endpush