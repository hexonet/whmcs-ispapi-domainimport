<form class="form-horizontal" method="POST" id="importform" onsubmit="return false;">
    <input type="hidden" name="action" value="pull"/>
    <input type="hidden" name="registrar" id="registrar" value="{$registrar}"/>
    <div class="form-group">
        <label for="gateway" class="control-label col-sm-2">{$_lang['label.gateway']}</label>
        <div class="col-sm-10">
            <select id="gateway" name="gateway" class="form-control">
                {foreach from=$gateways key=gateway item=name}
                    <option value="{$gateway}"{$gateway_selected[$gateway]}>{$name}</option>
                {/foreach}
            </select>
        </div>
    </div>
    <div class="form-group">
        <label for="currency" class="control-label col-sm-2">{$_lang['label.currency']}</label>
        <div class="col-sm-10">
            <select id="currency" name="currency" class="form-control">
                {foreach from=$currencies key=currency item=item}
                    <option value="{$item.id}"{$currency_selected[$item.id]}>{$currency}</option>
                {/foreach}
            </select>
        </div>
    </div>
    <div class="form-group">
        <label for="domain" class="control-label col-sm-2">{$_lang['label.domain']}</label>
        <div class="col-sm-10">
            <input type="text" class="form-control" id="domain" name="domain" value="{$smarty.request.domain}" placeholder="{$_lang['ph.domainfilter']}" />
        </div>
    </div>
    <div class="form-group">
        <label class="control-label col-sm-2" for="toClientImport">
            <input type="hidden" value="0" name="toClientImport"/>
            <input class="form-check-input" type="checkbox" value="1" name="toClientImport" id="toClientImport"{if $smarty.request.toClientImport === "1"} checked{/if}/> Import to
        </label>
        <div class="col-sm-10">
            <input type="text" class="form-control" id="clientid" name="clientid" value="{$smarty.request.clientid}" placeholder="{$_lang['ph.clientid']}"{if $smarty.request.toClientImport === "0"}disabled {/if}/>
            <small>(Otherwise we will automatically create new clients in WHMCS based on the registrant data per domain.)</small>{$clientdetails}
        </div>
    </div>
    <div class="form-group clientdetails" style="display:none;">
        <div class="col-sm-2"></div>
        <div class="col-sm-10" id="clientdetailscont"></div>
    </div>
    <div class="form-group">
        <div class="col-sm-offset-2 col-sm-10">
            <button type="button" id="pull" class="btn btn-default actionBttn">{$_lang['bttn.pulldomainlist']}</button>
        </div>
    </div>
    <div class="form-group listdomains" style="display:none">
        <label for="domains" id="labeldomains" class="control-label col-sm-2" style="padding-top:0px">{$_lang['label.domains']}</label>
        <div class="col-sm-10">
            {include file='error.tpl' error=$_lang['nodomainsfounderror']}
            {include file='success.tpl' msg=$_lang['domainsfound'] }<br/><br/>
            <textarea name="domains" id="domains" rows="10" class="form-control" readonly>{$smarty.request.domains}</textarea>
        </div>
    </div>
    <div class="form-group listdomains" style="display:none">
        <div class="col-sm-offset-2 col-sm-10">
            <button type="button" id="import" class="btn btn-default actionBttn">{$_lang['bttn.importdomainlist']}</button>
        </div>
    </div>
</form>
<script type="text/javascript" src="{$WEB_ROOT}/modules/addons/ispapidomainimport/assets/form.js"></script>