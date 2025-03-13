@extends(getTemplate() .'.panel.layouts.panel_layout')
@push('styles_top')
    <link rel="stylesheet" href="/assets/vendors/fontawesome/css/all.min.css">

    <style>
        .table-container {
            overflow-x: auto; /* Enable horizontal scrolling */
            width: 100%; /* Ensure the container takes full width */
        }

        #datatable-details {
            width: 100%; /* Ensure the table takes full width */
            min-width: 800px; /* Set a minimum width to ensure it overflows */
        }
    </style>
@endpush
@section('content')
    <section class="section">
        <div class="section-header mb-2">
            <h1>{{ $webinarTitle }} - {{ trans('update.waitlists') }}</h1>
            {{-- <div class="section-header-breadcrumb">
                <div class="breadcrumb-item active"><a href="{{ getAdminPanelUrl() }}">{{trans('admin/main.dashboard')}}</a>
                </div>
                <div class="breadcrumb-item">{{trans('update.waitlists')}}</div>
            </div> --}}
        </div>

        <div class="section-body">

            <div class="card mb-2">
                <div class="card-body">
                    <form method="get" class="mb-0">
                        <div class="row">
                            <div class="col-md-4">
                                <div class="form-group">
                                    <label class="input-label">{{trans('admin/main.search')}}</label>
                                    <input type="text" class="form-control" name="search" placeholder="" value="{{ request()->get('search') }}">
                                </div>
                            </div>

                            <div class="col-md-4">
                                <div class="form-group">
                                    <label class="input-label">{{trans('admin/main.start_date')}}</label>
                                    <div class="input-group">
                                        <input type="date" id="fsdate" class="text-center form-control" name="from" value="{{ request()->get('from') }}" placeholder="Start Date">
                                    </div>
                                </div>
                            </div>

                            <div class="col-md-4">
                                <div class="form-group">
                                    <label class="input-label">{{trans('admin/main.end_date')}}</label>
                                    <div class="input-group">
                                        <input type="date" id="lsdate" class="text-center form-control" name="to" value="{{ request()->get('to') }}" placeholder="End Date">
                                    </div>
                                </div>
                            </div>

                            <div class="col-md-3">
                                <div class="form-group">
                                    <label class="input-label">{{trans('update.registration_status')}}</label>
                                    <select name="registration_status" class="form-control">
                                        <option value="">{{trans('admin/main.all')}}</option>
                                        <option value="registered" {{ (request()->get('registration_status') == "registered") ? 'selected' : '' }}>{{ trans('update.registered') }}</option>
                                        <option value="unregistered" {{ (request()->get('registration_status') == "unregistered") ? 'selected' : '' }}>{{ trans('update.unregistered') }}</option>
                                    </select>
                                </div>
                            </div>

                            <div class="col-md-2">
                                <div class="form-group mt-3">
                                    <label class="input-label"> </label>
                                    <input type="submit" class="text-center btn btn-primary" value="{{trans('admin/main.show_results')}}">
                                </div>
                            </div>

                        </div>
                    </form>
                </div>
            </div>

            <div class="card">
                <div class="card-header">
                    @can('admin_waitlists_exports')
                        <a href="/panel/waitlists/{$waitlistId}/export_list" class="btn btn-primary">{{ trans('admin/main.export_xls') }}</a>
                    @endcan
                </div>

                <div class="card-body">
                <div class="table-container">
                <table class="table table-striped font-14" id="datatable-details">                        <thead>
                        <thead>
                        <tr>
                            <th class="text-left">{{ trans('admin/main.name') }}</th>
                            <th class="">{{ trans('auth.email') }}</th>
                            <th class="">{{ trans('auth.grade') }}</th>
                            <th class="">{{ trans('auth.hospital') }}</th>
                            <th class="">{{ trans('auth.service') }}</th>
                            <th class="">{{ trans('public.phone') }}</th>
                            <th class="">{{ trans('update.registration_status') }}</th>
                            <th class="">{{ trans('update.submission_date') }}</th>
                            <th class="">{{ trans('admin/main.amount') }}</th>
                            <th class="">{{ trans('public.accepted') }}</th>
                            <th class="text-left">{{ trans('admin/main.actions') }}</th>
                        </tr>
                        </thead>

                        <tbody>
                        @foreach($waitlists as $waitlist)
                        @php 
                        $ticket=null;
                        foreach ($waitlist->webinar->tickets as $ticket) {
                            $ticket=$ticket;
                        }
                        @endphp
                            <tr>
                                <td class="text-left">{{ !empty($waitlist->user) ? $waitlist->user->full_name : $waitlist->full_name }}</td>

                                <td class="text-center">{{ !empty($waitlist->user) ? $waitlist->user->email : $waitlist->email }}</td>
                                
                                <td class="text-center">{{ (!empty($waitlist->user) ? $waitlist->user->grade : $waitlist->grade) ?? '-' }}</td>

                                <td class="text-center">{{ (!empty($waitlist->user) ? $waitlist->user->hospital : $waitlist->hospital) ?? '-' }}</td>

                                <td class="text-center">{{ (!empty($waitlist->user) ? $waitlist->user->service : $waitlist->service) ?? '-' }}</td>
                                
                                <td class="text-center">{{ (!empty($waitlist->user) ? $waitlist->user->phone : $waitlist->phone) ?? '-' }}</td>
                                
                                <td class="text-center">
                                    @if(!empty($waitlist->user))
                                        <span class="">{{ trans('update.registered') }}</span>
                                    @else
                                        <span class="">{{ trans('update.unregistered') }}</span>
                                    @endif
                                </td>

                                <td class="text-center">{{ dateTimeFormat($waitlist->created_at, 'j M Y H:i') }}</td>
                               
                                <td class="text-center"> 
                                    @if($waitlist->webinar->price)
                                        @if(!empty($ticket))
                                          <div class="mt-0 mb-1 font-weight-bold " >{{ handleCoursePagePrice($ticket->getPriceWithDiscount($waitlist->webinar->price, !empty($waitlist->webinar->activeSpecialOffer()) ? $waitlist->webinar->activeSpecialOffer() : null))['price'] }}</div>                                        
                                            @else
                                            <div class="mt-0 mb-1 font-weight-bold " >  {{ handleCoursePagePrice($waitlist->webinar->price)['price'] }}</div>       
                                            @endif @else
                                        <div class="mt-0 mb-1 font-weight-bold " >  {{  trans('public.free')   }}</div>
                                    @endif
                                </td>                                
                                
                                <td class="text-center">
                                    <div class="mt-0 mb-1 font-weight-bold {{ ($waitlist->is_accepted) ? 'text-success' : 'text-warning' }}" >{{ trans($waitlist->is_accepted?'public.accepted':'public.not_accepted') }}</div>
                                </td>                                
                                <td class="text-center">
                                    <div class="d-flex align-items-center justify-content-start">
                                        <a href="/panel/waitlists/items/{{$waitlist->id}}/delete" 
                                            title="reject"
                                            class="delete-action btn btn-sm btn-transparent text-danger ml-3">
                                            <i class="fa fa-times"></i>
                                        </a>
                                        <a href="/panel/waitlists/notifications/users/{{$waitlist->user->id}}/waitlist/{{$waitlist->id}}" 
                                            title="accept & notify"
                                            class="notification-action text-warning text-decoration-none btn-transparent ml-3">
                                            <i class="fa fa-bell"></i>
                                        </a>
                                    </div>
                                </td>
                            </tr>
                        @endforeach
                        </tbody>

                    </table>
                    </div>
                    </div>

                <div class="card-footer text-center">
                    {{ $waitlists->appends(request()->input())->links() }}
                </div>
            </div>
        </div>
    </section>
@endsection
