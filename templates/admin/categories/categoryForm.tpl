{**
 * templates/admin/categories/categoryForm.tpl
 *
 * Copyright (c) 2013-2016 Simon Fraser University Library
 * Copyright (c) 2003-2016 John Willinsky
 * Distributed under the GNU GPL v2. For full terms see the file docs/COPYING.
 *
 * Category form under site administration.
 *
 *}
{strip}
{assign var="pageId" value="admin.categories.categoryForm"}
{assign var="pageCrumbTitle" value=$pageTitle}
{include file="common/header.tpl"}
{/strip}
<div id="categoryFormDiv">

<form id="categoryForm" method="post" action="{url op="updateCategory"}" class="form-horizontal">
{if $category}
	<input type="hidden" name="categoryId" value="{$category->getId()}"/>
{/if}

{include file="common/formErrors.tpl"}


{if count($formLocales) > 1}
<div class="form-group">
<div class="col-md-3 col-sm-3 control-label">
{fieldLabel name="formLocale" key="form.formLanguage"}
</div>
<div class="col-md-7 col-sm-7">
			{if $category}{url|assign:"categoryFormUrl" op="editCategory" path=$category->getId() escape=false}
			{else}{url|assign:"categoryFormUrl" op="createCategory" escape=false}
			{/if}
			{form_language_chooser form="categoryForm" url=$categoryFormUrl}
			<span class="instruct">{translate key="form.formLanguage.description"}</span>
			</div>
	</div>

{/if}
<div class="form-group">
<div class="col-md-3 col-sm-3 control-label">
{fieldLabel name="name" required="true" key="admin.categories.name"}
</div>
<div class="col-md-7 col-sm-7">
<input type="text" name="name[{$formLocale|escape}]" value="{$name[$formLocale]|escape}" size="35" maxlength="80" id="name" class="form-control" />
	</div>
	</div>

<div class="form-group">
<div class="col-md-offset-3 col-sm-offset-3">
<p><input type="submit" value="{translate key="common.save"}" class="btn btn-primary" /> <input type="button" value="{translate key="common.cancel"}" class="btn btn-warning" onclick="document.location.href='{url op="categories" escape=false}'" /></p>
</div>
</div>
</form>

<p><span class="formRequired">{translate key="common.requiredField"}</span></p>
</div>
{include file="common/footer.tpl"}

