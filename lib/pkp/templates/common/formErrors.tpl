{**
 * lib/pkp/templates/common/formErrors.tpl
 *
 * Copyright (c) 2013-2016 Simon Fraser University Library
 * Copyright (c) 2000-2016 John Willinsky
 * Distributed under the GNU GPL v2. For full terms see the file docs/COPYING.
 *
 * List errors that occurred during form processing.
 *}
{if $isError}

	<div  class="alert alert-danger">
		<p>
		<span >{translate key="form.errorsOccurred"}:</span>
		<ul class="list-unstyled">
		{foreach key=field item=message from=$errors}
			<li><a href="#{$field|escape}">{$message}</a></li>
		{/foreach}
	
	</div>
	<script type="text/javascript">{literal}
		<!--
		// Jump to form errors.
		window.location.hash="formErrors";
		// -->
	{/literal}</script>
{/if}
