<button class="@if(empty($hideDefaultClass) or !$hideDefaultClass) {{ !empty($noBtnTransparent) ? '' : 'btn-transparent' }} text-info @endif {{ $btnClass ?? '' }}"
        data-confirm="{{ $notificationConfirmMsg ?? trans('admin/main.confirm_send_verification_request') }}"
        data-confirm-href="{{ $url }}"
        data-confirm-text-yes="{{ trans('admin/main.yes') }}"
        data-confirm-text-cancel="{{ trans('admin/main.cancel') }}"
        @if(empty($btnText))
        data-toggle="tooltip" data-placement="top" title="{{ !empty($tooltip) ? $tooltip : trans('admin/main.notify') }}"
    @endif
>
    @if(!empty($btnText))
        {!! $btnText !!}
    @else
        <i class="fa {{ !empty($btnIcon) ? $btnIcon : 'fa-bell' }}" aria-hidden="true"></i>
    @endif
</button>
