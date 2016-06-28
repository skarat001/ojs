{**
 * templates/manager/setup/setupHeader.tpl
 *
 * Copyright (c) 2013-2016 Simon Fraser University Library
 * Copyright (c) 2003-2016 John Willinsky
 * Distributed under the GNU GPL v2. For full terms see the file docs/COPYING.
 *
 * Header for journal setup pages.
 *
 *}
{strip}
{assign var="pageCrumbTitle" value="manager.setup.journalSetup"}
{url|assign:"currentUrl" op="setup"}
{include file="common/header.tpl"}
{/strip}



	<ul class="nav nav-pills">
		<li class="nav-item {if $setupStep == 1} active{/if}"><a href="{url op="setup" path="1"}" class="nav-link">{translate key="manager.setup.details"}</a></li>
		<li class="nav-item {if $setupStep == 2} active{/if}"><a href="{url op="setup" path="2"}" class="nav-link">{translate key="manager.setup.policies"}</a></li>

		<li class="nav-item {if $setupStep == 3} active{/if}"><a href="{url op="setup" path="3"}" class="nav-link">{translate key="manager.setup.submissions"}</a></li>

		<li class="nav-item {if $setupStep == 4} active{/if}"><a href="{url op="setup" path="4"}" class="nav-link">{translate key="manager.setup.management"}</a></li>
		<li class="nav-item {if $setupStep == 5} active{/if}"><a href="{url op="setup" path="5"}" class="nav-link">{translate key="manager.setup.look"}</a></li>
	</ul>
	<hr>

