<?php
    use App\Models\Utility;
    $users = \Auth::user();
    $currantLang = $users->currentLanguage();
    $languages = Utility::languages();
    // $profile = asset(Storage::url('uploads/avatar/'));
    $profile = \App\Models\Utility::get_file('uploads/avatar');

    $mode_setting = \App\Models\Utility::mode_layout();
?>
<header
    class="dash-header  <?php echo e(isset($mode_setting['is_sidebar_transperent']) && $mode_setting['is_sidebar_transperent'] == 'on' ? 'transprent-bg' : ''); ?>">
    <div class="header-wrapper">
        <div class="me-auto dash-mob-drp">
            <ul class="list-unstyled">
                <li class="dash-h-item mob-hamburger">
                    <a href="#!" class="dash-head-link" id="mobile-collapse">
                        <div class="hamburger hamburger--arrowturn">
                            <div class="hamburger-box">
                                <div class="hamburger-inner">
                                    <img src="" alt="">
                                </div>
                            </div>
                        </div>
                    </a>
                </li>
                <li class="dropdown dash-h-item drp-company">
                    <a class="dash-head-link dropdown-toggle arrow-none me-0" data-bs-toggle="dropdown" href="#"
                        role="button" aria-haspopup="false" aria-expanded="false">
                        <span class="theme-avtar">
                            <img alt="#"
                                src="<?php echo e(!empty($users->avatar) ? $profile . '/' . $users->avatar : $profile . '/avatar.png'); ?>"
                                class="header-avtar" style="width: 100%; border-radius: 50%;">
                        </span>
                        <span class="hide-mob ms-2"> <?php echo e(__('Hi, ')); ?><?php echo e(Auth::user()->name); ?>!
                            <i class="ti ti-chevron-down drp-arrow nocolor hide-mob"></i>
                    </a>
                    <div class="dropdown-menu dash-h-dropdown">
                        <a href="<?php echo e(route('profile')); ?>" class="dropdown-item">
                            <i class="ti ti-user"></i>
                            <span><?php echo e(__('My Profile')); ?></span>
                        </a>

                        <a href="<?php echo e(route('logout')); ?>" class="dropdown-item"
                            onclick="event.preventDefault();document.getElementById('logout-form').submit();">
                            <i class="ti ti-power"></i>
                            <span><?php echo e(__('Logout')); ?></span>
                        </a>
                        <form id="logout-form" action="<?php echo e(route('logout')); ?>" method="POST" style="display: none;">
                            <?php echo csrf_field(); ?></form>
                    </div>
                </li>
            </ul>
        </div>
        <div class="ms-auto">
            <ul class="list-unstyled">

                
                <?php
                    $unseenCounter = App\Models\ChMessage::where('to_id', Auth::user()->id)
                        ->where('seen', 0)
                        ->count();
                ?>


                

                <?php if(\Auth::user()->type != 'super admin'): ?>
                    <li class="dropdown dash-h-item drp-notification">
                        
                        <div class="dropdown-menu dash-h-dropdown dropdown-menu-end">
                            <div class="noti-header">
                                <h5 class="m-0"><?php echo e(__('Messages')); ?></h5>
                                <a href="#"
                                    class="dash-head-link mark_all_as_read_message"><?php echo e(__('Clear All')); ?></a>
                            </div>

                            <div class="noti-body dropdown-list-message-msg">
                                <div style="display: flex;">
                                    <a href="#" class="show-listView"><i class="fas fa-arrow-left"></i></a>
                                    
                                    <div class="count-listOfContacts">
                                    </div>
                                </div>
                            </div>
                            <div class="noti-footer">
                                <div class="d-grid">
                                    <a href="<?php echo e(route('chats')); ?>"
                                        class="btn dash-head-link justify-content-center text-primary mx-0">View
                                        all</a>
                                </div>
                            </div>
                        </div>
                    </li>
                <?php endif; ?>
                <?php
                    // $currantLang = basename(\App::getLocale());
                    // $languages = \App\Models\Utility::languages();
                    // $lang = isset($users->lang) ? $users->lang : 'en';
                    // if ($lang == null) {
                    //     $lang = 'en';
                    // }
                    // $LangName = \App\Models\Languages::where('code', $lang)->first();

                    $lang = isset($users->lang) ? $users->lang : 'en';
                    if ($lang == null) {
                        $lang = 'en';
                    }
                    $LangName = \App\Models\Languages::where('code', $lang)->first();
                    if (empty($LangName)) {
                        $LangName = new App\Models\Utility();
                        $LangName->fullName = 'English';
                    }
                ?>
                <li class="dropdown dash-h-item drp-language">
                    <a class="dash-head-link dropdown-toggle arrow-none me-0" data-bs-toggle="dropdown" href="#"
                        role="button" aria-haspopup="false" aria-expanded="false" id="dropdownLanguage">
                        <i class="ti ti-world nocolor"></i>
                        <span class="drp-text hide-mob"><?php echo e(Str::ucfirst($LangName->fullName)); ?></span>
                        <i class="ti ti-chevron-down drp-arrow nocolor"></i>
                    </a>
                    <div class="dropdown-menu dash-h-dropdown dropdown-menu-end" aria-labelledby="dropdownLanguage">
                        
                        <?php $__currentLoopData = App\Models\Utility::languages(); $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $code => $lang): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                            <a href="<?php echo e(route('change.language', $code)); ?>"
                                class="dropdown-item <?php echo e($currantLang == $code ? 'text-primary' : ''); ?>">
                                <span><?php echo e(ucFirst($lang)); ?></span>
                            </a>
                        <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
                        <?php if (app(\Illuminate\Contracts\Auth\Access\Gate::class)->check('Create Language')): ?>
                            <?php if(\Auth::user()->type == 'company'): ?>
                                <div class="dropdown-divider m-0"></div>
                                <a href="#" class="dropdown-item text-primary" data-size="md"
                                    data-url="<?php echo e(route('create.language')); ?>" data-ajax-popup="true"
                                    data-title="<?php echo e(__('Create New Language')); ?>"
                                    data-bs-toggle="tooltip"><?php echo e(__('Create Language')); ?></a>
                                <div class="dropdown-divider m-0"></div>
                                <a href="<?php echo e(route('manage.language', [basename(App::getLocale())])); ?>"
                                    class="dropdown-item text-primary"><?php echo e(__('Manage Language')); ?></a>
                            <?php endif; ?>
                        <?php endif; ?>
                        
                    </div>
                </li>

            </ul>
        </div>
    </div>
</header>

<?php $__env->startPush('scripts'); ?>
    
    <script>
        // console.log($('#msg-btn'));
        $('#msg-btn').click(function() {
            let contactsPage = 1;
            let contactsLoading = false;
            let noMoreContacts = false;
            $.ajax({
                url: url + "/getContacts",
                method: "GET",
                data: {
                    _token: "<?php echo e(csrf_token()); ?>",
                    page: contactsPage,
                    type: 'custom',
                },
                dataType: "JSON",
                success: (data) => {

                    if (contactsPage < 2) {
                        $(".count-listOfContacts").html(data.contacts);

                    } else {
                        $(".count-listOfContacts").append(data.contacts);
                    }
                    $('.count-listOfContacts').find('.messenger-list-item').each(function(e) {
                        $('.noti-body .activeStatus').remove()
                        $('.noti-body .avatar').remove()
                        $(this).find('span').remove()
                        $(this).find('p').addClass("d-inline")
                        $(this).find('b').css({
                            "position": "absolute",
                            "right": "50px"
                        });
                        $(this).find('tr').remove('td')

                    })
                },
                error: (error) => {
                    setContactsLoading(false);
                    console.error(error);
                },
            });
        })
    </script>
<?php $__env->stopPush(); ?>
<?php /**PATH E:\WEB-Development\laragon\www\HR_SACO\codecanyon-boyrJ4Un-hrmgo-hrm-and-payroll-tool\main-file\resources\views/partial/Admin/header.blade.php ENDPATH**/ ?>