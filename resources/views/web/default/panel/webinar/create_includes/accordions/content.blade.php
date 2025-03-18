<!-- resources/views/web/default/panel/webinar/create_includes/accordions/content.blade.php -->

<div class="accordion webinar-content-form mt-15">
    <div class="row">
        <div class="col-lg-6 col-md-10 col-sm-12">

            <!-- Objectives -->
            <div class="form-group">
                <label class="input-label">{{ trans('panel.objectives') }}</label>
                <textarea name="objectives" class="summernote form-control text-left @error('objectives') is-invalid @enderror" rows="5" placeholder="{{ trans('panel.objectives_placeholder') }}">{{ old('objectives', $webinar->content->objectives ?? '') }}</textarea>
                @error('objectives')
                    <div class="invalid-feedback">{{ $message }}</div>
                @enderror
            </div>

            <!-- Target Audience -->
            <div class="form-group">
                <label class="input-label">{{ trans('panel.target_audience') }}</label>
                <textarea name="target_audience" class="summernote form-control text-left @error('target_audience') is-invalid @enderror" rows="5" placeholder="{{ trans('panel.target_audience_placeholder') }}">{{ old('target_audience', $webinar->content->target_audience ?? '') }}</textarea>
                @error('target_audience')
                    <div class="invalid-feedback">{{ $message }}</div>
                @enderror
            </div>

            <!-- Program -->
            <div class="form-group">
                <label class="input-label">{{ trans('panel.program') }}</label>
                <textarea name="program" class="summernote form-control text-left @error('program') is-invalid @enderror" rows="5" placeholder="{{ trans('panel.program_placeholder') }}">{{ old('program', $webinar->content->program ?? '') }}</textarea>
                @error('program')
                    <div class="invalid-feedback">{{ $message }}</div>
                @enderror
            </div>

            <!-- Attached File -->
            <div class="form-group">
                <label class="input-label">{{ trans('panel.attach_file') }}</label>
                <div class="input-group @error('attach_file') is-invalid @enderror">
                    <div class="input-group-prepend">
                        <button type="button" class="input-group-text panel-file-manager" data-input="attach_file" data-preview="holder">
                            <i data-feather="arrow-up" width="18" height="18" class="text-white"></i>
                        </button>
                    </div>
                    <input type="text" name="attach_file" id="attach_file" value="{{ old('attach_file', $webinar->content->file_path ?? '') }}" class="form-control" />
                </div>
                @error('attach_file')
                    <div class="invalid-feedback">{{ $message }}</div>
                @enderror
            </div>
        </div>
    </div>
</div>