{**
 * templates/reviewer/index.tpl
 *
 * Copyright (c) 2013-2016 Simon Fraser University Library
 * Copyright (c) 2003-2016 John Willinsky
 * Distributed under the GNU GPL v2. For full terms see the file docs/COPYING.
 *
 * Reviewer index.
 *
 *}
{strip}
{assign var="pageTitle" value="common.queue.long.$pageToDisplay"}
{include file="common/header.tpl"}
{/strip}

<ul class="nav nav-pills">
	<li class="nav-item {if $pageToDisplay == "active"} active {/if}"><a href="{url path="active"}" class="nav-link">{translate key="common.queue.short.active"}</a></li>
	<li class="nav-item {if $pageToDisplay == "completed"} active {/if}"><a href="{url path="completed"}" >{translate key="common.queue.short.completed"}</a></li>

</ul>



<hr>

{include file="reviewer/$pageToDisplay.tpl"}

{include file="common/footer.tpl"}

