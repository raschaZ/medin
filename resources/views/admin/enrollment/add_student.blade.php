@extends('admin.layouts.app')

@section('content')
    <section class="section">
        <div class="section-header">
            <h1>{{ $pageTitle }}</h1>
            <div class="section-header-breadcrumb">
                <div class="breadcrumb-item active"><a href="{{ getAdminPanelUrl() }}">{{ trans('admin/main.dashboard') }}</a></div>
                <div class="breadcrumb-item">{{ $pageTitle }}</div>
            </div>
        </div>

        <div class="section-body">
           <div class="row">
                <div class="col-12 col-md-12">
                    <div class="card">
                        <div class="card-body">
                            <div class="row">
                                <div class="col-12 col-md-6"> 
                                     @php
                                        $waitlistId = request('waitlist_id');
                                        $selectedWebinar = request('webinar_id');
                                        $selectedUser = request('user_id');
                                        $amount = request('amount');
                                     @endphp
                                    <form action="{{ getAdminPanelUrl() }}/enrollments/{{$waitlistId}}/add-waitlist" method="post">
                                        {{ csrf_field() }}

                                      

                                        <!-- Class Dropdown -->
                                        <div class="form-group">
                                            <label class="input-label">{{ trans('admin/main.class') }}</label>
                                            <select name="webinar_id" class="form-control search-webinar-select2" data-placeholder="Search classes">
                                                @foreach($webinars as $webinar)
                                                    <option value="{{ $webinar->id }}" {{ $selectedWebinar == $webinar->id ? 'selected' : '' }}>
                                                        {{ $webinar->title }}
                                                    </option>
                                                @endforeach
                                            </select>

                                            @error('webinar_id')
                                            <div class="invalid-feedback d-block">{{ $message }}</div>
                                            @enderror
                                        </div>

                                        <!-- User Dropdown -->
                                        <div class="form-group">
                                            <label class="input-label d-block">{{ trans('admin/main.user') }}</label>
                                            <select name="user_id" class="form-control search-user-select2" data-placeholder="{{ trans('public.search_user') }}">
                                                @foreach($users as $user)
                                                    <option value="{{ $user->id }}" {{ $selectedUser == $user->id ? 'selected' : '' }}>
                                                        {{ $user->full_name }}
                                                    </option>
                                                @endforeach
                                            </select>
                                            @error('user_id')
                                            <div class="invalid-feedback d-block">{{ $message }}</div>
                                            @enderror
                                        </div>
                                        
                                        <div class="form-group">
                                            <label>{{ trans('admin/main.amount') }}</label>
                                            <div class="input-group">
                                                <div class="input-group-prepend">
                                                    <div class="input-group-text">
                                                        {{ $currency }}
                                                    </div>
                                                </div>
        
                                                <input type="number" name="amount"
                                                       class="form-control text-center @error('amount') is-invalid @enderror"
                                                       value="{{ (!empty($amount) and !empty($amount)) ? convertPriceToUserCurrency($amount) : old('amount') }}"
                                                       {{-- placeholder="{{ trans('update.discount_amount_placeholder') }}"--}}
                                                       /> 
                                                @error('amount')
                                                <div class="invalid-feedback">
                                                    {{ $message }}
                                                </div>
                                                @enderror
                                            </div>
                                        </div>
                                        <!-- Submit Button -->
                                        <div class="mt-4">
                                            <button type="submit" class="btn btn-primary">{{ trans('admin/main.add') }}</button>
                                        </div>
                                    </form>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
@endsection

