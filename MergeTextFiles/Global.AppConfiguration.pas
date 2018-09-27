unit Global.AppConfiguration;

interface

type
  TAppConfiguration = class
    class var secureUrlUnsubscribe: string;
    class procedure loadSecureConfiguration;
  end;

implementation

uses
  System.JSON, System.SysUtils, System.IOUtils;

resourcestring
  StrDefaultImportUnsubscribedURL = 'http://www.delphi.pl/newsletter/remove.txt';

const
  StrSecureDataJsonFile = 'secure-data.json';

class procedure TAppConfiguration.loadSecureConfiguration;
var
  url: string;
  text: string;
  jSecure: TJSONObject;
  jValue: TJSONValue;
  s: string;
begin
  self.secureUrlUnsubscribe := StrDefaultImportUnsubscribedURL;
  if FileExists(StrSecureDataJsonFile) then
  begin
    text := TFile.ReadAllText(StrSecureDataJsonFile);
    jValue := TJSONObject.ParseJSONValue(text);
    if jValue is TJSONObject then
    begin
      jSecure := jValue as TJSONObject;
      s := jSecure.ToString;
      if s<>'' then
      if jSecure.TryGetValue<String>('OpenAPI-Unsubsrcribed-URL', url) then
        self.secureUrlUnsubscribe := url;
    end;
    jValue.Free;
  end;
end;


end.
