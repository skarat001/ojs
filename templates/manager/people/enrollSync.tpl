{**
 * templates/manager/people/enrollSync.tpl
 *
 * Copyright (c) 2013-2016 Simon Fraser University Library
 * Copyright (c) 2003-2016 John Willinsky
 * Distributed under the GNU GPL v2. For full terms see the file docs/COPYING.
 *
 * Synchronize user enrollment with another journal.
 *
 *}
{strip}
{assign var="pageTitle" value="manager.people.enrollment"}
{include file="common/header.tpl"}
{/strip}
<div id="syncUsers">
<h3>{translate key="manager.people.syncUsers"}</h3>

<p><span class="instruct">{translate key="manager.people.syncUserDescription"}</span></p>

<form method="post" action="{url op="enrollSync"}" class="form-horizontal">
<div class="form-group">
<div class="col-md-3 col-sm-3 control-label">
<label>
{translate key="manager.people.enrollSyncRole"}</label>
</div>
<div class="col-md-7 col-sm-7">
			{if $rolePath}
				<input type="hidden" name="rolePath" value="{$rolePath|escape}" />
				{translate key=$roleName}
			{else}
				<select name="rolePath" id="rolePath" size="1" class="form-control">
					<option value=""></option>
					<option value="all">{translate key="manager.people.allUsers"}</option>
					<option value="manager">{translate key="user.role.manager"}</option>
					<option value="editor">{translate key="user.role.editor"}</option>
					<option value="sectionEditor">{translate key="user.role.sectionEditor"}</option>
					<option value="layoutEditor">{translate key="user.role.layoutEditor"}</option>
					<option value="reviewer">{translate key="user.role.reviewer"}</option>
					<option value="copyeditor">{translate key="user.role.copyeditor"}</option>
					<option value="proofreader">{translate key="user.role.proofreader"}</option>
					<option value="author">{translate key="user.role.author"}</option>
					<option value="reader">{translate key="user.role.reader"}</option>
					<option value="subscriptionManager">{translate key="user.role.subscriptionManager"}</option>
				</select>
			{/if}
		</div>
	</div>
	<div class="form-group">
<div class="col-md-3 col-sm-3 control-label">
	<label for="syncJournal">{translate key="manager.people.enrollSyncJournal"}</label>
</div>
<div class="col-md-7 col-sm-7">
			<select name="syncJournal" id="syncJournal" size="1" class="form-control">
				<option value=""></option>
				<option value="all">{translate key="manager.people.allJournals"}</option>
				{html_options options=$journalOptions}
			</select>
		</div>
	</div>	

<div class="form-group">
<div class="col-md-offset-3 col-sm-offset-3">
<p><input type="submit" value="{translate key="manager.people.enrollSync"}" class="btn btn-primary" /> <input type="button" value="{translate key="common.cancel"}" class="btn btn-warning" onclick="history.go(-1)" /></p>
	</div>
	</div>
</form>
</div>
{include file="common/footer.tpl"}

