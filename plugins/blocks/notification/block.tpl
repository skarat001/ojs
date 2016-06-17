{**
 * plugins/blocks/notification/block.tpl
 *
 * Copyright (c) 2013-2016 Simon Fraser University Library
 * Copyright (c) 2003-2016 John Willinsky
 * Distributed under the GNU GPL v2. For full terms see the file docs/COPYING.
 *
 * Common site sidebar menu -- "Notification" block.
 *
 *}
 {if $currentJournal}
<div class="panel panel-default" id="notification">
<div class="panel-heading">
<span class="blockTitle"><i class="fa fa-exclamation-circle fa-1x" ></i>	{translate key="notification.notifications"}</span>
	</div>
	<div class="panel-body">
	<ul>
		{if $isUserLoggedIn}
			<li><a href="{url page="notification"}">{translate key="common.view"}</a>
				{if $unreadNotifications > 0}{translate key="notification.notificationsNew" numNew=$unreadNotifications}{/if}</li>
			<li><a href="{url page="notification" op="settings"}">{translate key="common.manage"}</a></li>
		{else}
			<li><a href="{url page="notification"}">{translate key="common.view"}</a></li>
			<li><a href="{url page="notification" op="subscribeMailList"}">{translate key="notification.subscribe"}</a></li>
		{/if}
	</ul>
</div>
{/if}
</div>