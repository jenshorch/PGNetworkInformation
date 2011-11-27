var PGNetworkInformation = {
    getSSID: function(onSuccess, onFail){        
        return PhoneGap.exec(onSuccess, onFail, "PGNetworkInformation", "getSSID", "");
    }
}