{**
	* templates/editor/notifyUsers.tpl
	*
	* Copyright (c) 2013-2016 Simon Fraser University Library
	* Copyright (c) 2003-2016 John Willinsky
	* Distributed under the GNU GPL v2. For full terms see the file docs/COPYING.
	*
	* Editor's "Notify Users" email template form
	*
	*}
	{strip}
	{assign var="pageTitle" value="email.compose"}
	{assign var="pageCrumbTitle" value="email.email"}
	{include file="common/header.tpl"}
	{/strip}

	<div id="notifyUsers">
		<form method="post" action="{$formActionUrl}" class="form-horizontal">
			<input type="hidden" name="continued" value="1"/>
			{if $hiddenFormParams}
			{foreach from=$hiddenFormParams item=hiddenFormParam key=key}
			<input type="hidden" name="{$key|escape}" value="{$hiddenFormParam|escape}" />
			{/foreach}
			{/if}

			{include file="common/formErrors.tpl"}

			{foreach from=$errorMessages item=message}
			{if !$notFirstMessage}
			{assign var=notFirstMessage value=1}
			<h4>{translate key="form.errorsOccurred"}</h4>
			<ul class="plain">
				{/if}
				{if $message.type == MAIL_ERROR_INVALID_EMAIL}
				{translate|assign:"message" key="email.invalid" email=$message.address}
				<li>{$message|escape}</li>
				{/if}
				{/foreach}

				{if $notFirstMessage}
			</ul>
			<br/>
			{/if}

			<div id="recipients">
				<h3>{translate key="email.recipients"}</h3>
				<div class="form-group">
					<div class="col-md-12 col-sm-12 checkbox">
						<label for="allUsers">
							<input type="radio" id="allUsers" name="whichUsers" value="allUsers"/>

							{translate key="editor.notifyUsers.allUsers" count=$allUsersCount|default:0}</label>
						</div>
					</div>
					<div class="form-group">
						<div class="col-md-10 col-sm-10 checkbox">
							<label for="allReaders"><input type="radio" id="allReaders" name="whichUsers" value="allReaders"/>

								{translate key="editor.notifyUsers.allReaders" count=$allReadersCount|default:0}</label>
							</div>
						</div>
						<div class="form-group">
							<div class="col-md-10 col-sm-10 checkbox">
								<label for="allAuthors">
									<input type="radio" id="allAuthors" name="whichUsers" value="allAuthors"/>

									{translate key="editor.notifyUsers.allAuthors" count=$allAuthorsCount|default:0}</label>
								</div>
							</div>

							{if $currentJournal->getSetting('publishingMode') == $smarty.const.PUBLISHING_MODE_SUBSCRIPTION}
							<div class="form-group">
								<div class="col-md-10 col-sm-10 checkbox">
									<label for="allIndividualSubscribers">
										<input type="radio" id="allIndividualSubscribers" name="whichUsers" value="allIndividualSubscribers"/>

										{translate key="editor.notifyUsers.allIndividualSubscribers" count=$allIndividualSubscribersCount|default:0}</label>
									</div>
								</div>
								<div class="form-group">
									<div class="col-md-10 col-sm-10 checkbox">
										<label for="allInstitutionalSubscribers">
											<input type="radio" id="allInstitutionalSubscribers" name="whichUsers" value="allInstitutionalSubscribers"/>

											{translate key="editor.notifyUsers.allInstitutionalSubscribers" count=$allInstitutionalSubscribersCount|default:0}</label>
										</div>
									</div>
									<br/>
									{/if}{* publishingMode is PUBLISHING_MODE_SUBSCRIPTION *}
									<div class="form-group">
										<div class="col-md-10 col-sm-10 checkbox">
											<label>
												<input type="checkbox" name="sendToMailList" />

												{translate key="editor.notifyUsers.allMailingList" count=$allMailListCount|default:0}
											</label>
										</div>
									</div>

									{if $senderEmail}

									{translate key="email.bccSender" address=$senderEmail|escape}

									{/if}

								</div>{* recipients *}

								

								<div id="issue">
									<h3>{translate key="issue.issue"}</h3>

									<div class="form-group">
										<div class="col-md-3 col-sm-3">
											<label for="includeToc">
												<input type="checkbox" name="includeToc" id="includeToc" value="1"/>
												{translate key="editor.notifyUsers.includeToc"}</label>&nbsp;
											</div>
											<div class="col-md-7 col-sm-7">
												<select name="issue" id="issue" class="selectMenu">
													{iterate from=issues item=issue}
													<option {if $issue->getCurrent()}checked {/if}value="{$issue->getId()}">{$issue->getIssueIdentification()|strip_tags|truncate:40:"..."|escape}</option>
													{/iterate}
												</select>
											</div>
										</div>

									</div>

									

									<div class="form-group">
										<div class="col-md-3 col-sm-3 control-label">
											{ fieldLabel  key="email.from"}
										</div>
										<div class="col-md-7 col-sm-7">
											{$from|escape}
										</div>
									</div>
									<div class="form-group">
										<div class="col-md-3 col-sm-3 control-label">
											{fieldLabel name="subject" key="email.subject"}
										</div>
										<div class="col-md-7 col-sm-7">
											<input type="text" id="subject" name="subject" value="{$subject|escape}" size="60" maxlength="120" class="form-control" />
										</div>
									</div>
									<div class="form-group">
										<div class="col-md-3 col-sm-3 control-label">
											{fieldLabel name="body" key="email.body"}
										</div>
										<div class="col-md-7 col-sm-7">
											<textarea name="body" cols="60" rows="15" class="form-control">{$body|escape}</textarea>
										</div>
									</div>
									<div class="form-group">
										<div class="col-md-offset-3 col-sm-offset-3">
											<p><input name="send" type="submit" value="{translate key="email.send"}" class="btn btn-primary" /> <input type="button" value="{translate key="common.cancel"}" class="btn btn-warning" onclick="history.go(-1)" /></p>
										</div>
									</div>
								</form>
							</div>
							{include file="common/footer.tpl"}

