@extends(getTemplate() . '.panel.layouts.panel_layout')

@section('content')
<section >
    <div class="">
        <h2 class="section-title after-line">{{ trans('public.teachers_certificates') }}</h2>
    </div>

    <!-- Display Webinar Slug -->
    <div class="mt-3">
        <strong>{{ trans('webinars.class') }} : </strong> {{ $webinar->slug }}
    </div>

    <!-- Display Success or Error Messages -->
    @if(session('error'))
        <div class="alert alert-danger mt-15">{{ session('error') }}</div>
    @endif

    <!-- Teachers List -->
    <div class="teachers-list-container overflow mt-15">
        <table class="table text-center custom-table">
            <thead>
                <tr>
                    <th class="text-center">#</th>
                    <th class="text-center">{{ trans('public.name') }}</th>
                    <th class="text-center">{{ trans('public.email') }}</th>
                    @if (empty($teacherWebinarList)||(!empty($teacherWebinarList) && ($teacherWebinarList->status=='draft')))
                        <th class="text-center">{{ trans('public.controls') }}</th>
                    @endif
                </tr>
            </thead>
            <tbody>
                @if($teachers and $teachers->isNotEmpty()) 
                    @foreach($teachers as $index => $teacher)
                        <tr>
                            <td class="align-middle">{{ $loop->iteration }}</td>
                            <td class="align-middle">
                                <span class="d-block text-dark-blue font-weight-500">{{ $teacher->name }}</span>
                            </td>
                            <td class="align-middle">
                                <span class="d-block text-dark-blue font-weight-500">{{ $teacher->email }}</span>
                            </td>
                            @if (!empty($teacherWebinarList) && ($teacherWebinarList->status=='draft'))
                                <td>
                                    <!-- Delete Button -->
                                    <form 
                                        action="/panel/certificates/teachers-certificates/{{$webinar->id}}/teacher/{{ $teacher->id }}" 
                                        method="POST">
                                        @csrf
                                        @method('DELETE')
                                        <button type="submit" class="btn btn-sm btn-danger">{{ trans('public.delete') }}</button>
                                    </form>
                                </td>
                            @endif
                        </tr>
                    @endforeach
                @else
                    <tr>
                        <td class="align-middle" colspan="4">{{ trans('public.empty') }}</td>
                    </tr>
                @endif
            </tbody>
        </table>
    </div>

    @if (empty($teacherWebinarList)||(!empty($teacherWebinarList) && ($teacherWebinarList->status=='draft')))
        <!-- Add Teacher Form -->
        <div class="panel-section-card py-20 px-25 mt-20">
            <form action="/panel/certificates/teachers-certificates" method="POST">
                @csrf
                <input type="hidden" name="webinar_id" value="{{ $webinar->id }}">
                <div class="container">
                    <div class="row">
                        <!-- Name -->
                        <div class="col-sm mt-5">
                            <input type="text" name="name" class="form-control" placeholder="{{ trans('public.name') }}" required>
                        </div>
                        <!-- Email -->
                        <div class="col-sm mt-5">
                            <input type="email" name="email" class="form-control" placeholder="{{ trans('public.email') }}" required>
                        </div>
                        <!-- Submit -->
                        <div class="col-12 col-lg-2 mt-5 d-flex align-items-center justify-content-end">
                            <button type="submit" class="btn btn-sm btn-primary w-100">{{ trans('admin/main.add') }}</button>
                        </div>
                    </div>
                </div>
            </form>
        </div>

        <!-- Submit List ID to Admin -->
        <div class=" py-20 px-25 mt-20 ">
            <form action="/panel/certificates/teachers-certificates/send-to-admin" method="POST" class="mt-15">
                @csrf
                <input type="hidden" name="teacher_webinar_list_id" value="{{ $teacherWebinarList->id ?? '' }}">
                
                <div class="d-flex justify-content-center">
                    <button type="submit" class="btn btn-primary  w-25  btn-lg">
                        {{ trans('update.send') }}
                    </button>
                </div>
            </form>
        </div>
    @endif
</section>
@endsection
