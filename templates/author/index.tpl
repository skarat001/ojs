{**
 * templates/author/index.tpl
 *
 * Copyright (c) 2013-2016 Simon Fraser University Library
 * Copyright (c) 2003-2016 John Willinsky
 * Distributed under the GNU GPL v2. For full terms see the file docs/COPYING.
 *
 * Journal author index.
 *
 *}
{strip}
{assign var="pageTitle" value="common.queue.long.$pageToDisplay"}
{include file="common/header.tpl"}
{/strip}

<ul class="nav nav-pills">
	<li class="nav-item {if ($pageToDisplay == "active")} active{/if}" ><a href="{url op="index" path="active"}" class="nav-link">{translate key="common.queue.short.active"}</a></li>
	<li class="nav-item {if ($pageToDisplay == "completed")} active{/if}"><a href="{url op="index" path="completed"}" class="nav-link">{translate key="common.queue.short.completed"}</a></li>
</ul>

<br />

{include file="author/$pageToDisplay.tpl"}
<div id="submitStart">
<h4>{translate key="author.submit.startHereTitle"}</h4>
{url|assign:"submitUrl" op="submit"}
{translate submitUrl=$submitUrl key="author.submit.startHereLink"}<br />
</div>

{call_hook name="Templates::Author::Index::AdditionalItems"}

{include file="common/footer.tpl"}

