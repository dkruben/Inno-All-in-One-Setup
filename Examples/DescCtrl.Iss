; -- Example1.iss --
; restools
; http://restools.hanzify.org
; �����ܶ�����Ҫ������������ˬˬ��
; ʱ��ִ٣����Ա�̿��ܻ��е��������д���������
; descctrl.dll Ϊһ�� 6.5 KB ������������

#include "DescCtrl.ish"

[Setup]
AppName=My Program
AppVerName=My Program version 1.5
DefaultDirName={pf}\My Program
DefaultGroupName=My Program
UninstallDisplayIcon={app}\MyProg.exe
OutputDir=userdocs:Inno Setup Examples Output

[Components]
Name: "program"; Description: "�����ļ�"; Types: full compact custom; Flags: fixed
Name: "help"; Description: "�����ļ�"; Types: full
Name: "readme"; Description: "�����ļ�"; Types: full
Name: "readme\en"; Description: "Ӣ��"; Flags: exclusive
Name: "readme\de"; Description: "����"; Flags: exclusive
Name: "readme\cn"; Description: "����"; Flags: exclusive
Name: "readme\ru"; Description: "����"; Flags: exclusive
Name: "test"; Description: "����"; Types: full
Name: "test\test1"; Description: "����1"; Flags: checkablealone
Name: "test\test2"; Description: "����2"; Flags: checkablealone
Name: "test\test3"; Description: "����3"; Flags: checkablealone
Name: "test\test4"; Description: "����4"; Flags: checkablealone
Name: "test\test5"; Description: "����5"; Flags: checkablealone
Name: "test\test6"; Description: "����6"; Flags: checkablealone

[Files]
Source: "compiler:\Examples\MyProg.exe"; DestDir: "{app}"; Components: program
Source: "compiler:\Examples\MyProg.chm"; DestDir: "{app}"; Components: help

[Icons]
Name: "{group}\My Program"; Filename: "{app}\MyProg.exe"

[Code]

var
  Info: TNewStaticText;
  InfoCaption: TNewStaticText;
  InfoPanel: TPanel;

procedure DeinitializeSetup();
begin
  //�ͷ���������
  disabledesc();
end;

procedure InitializeWizard();
begin
  PDir('DescCtrl.dll');

  // ��������б��Ĵ�С
  WizardForm.TYPESCOMBO.Visible:= false;
  WizardForm.ComponentsList.Height := WizardForm.ComponentsList.Height + WizardForm.ComponentsList.Top - WizardForm.TYPESCOMBO.Top;
  WizardForm.ComponentsList.Top := WizardForm.TYPESCOMBO.Top;
  WizardForm.ComponentsList.Width := ScaleX(200);
  //����һ�������GroupBox����ΪInno Setup û�а���
  InfoPanel := TPanel.Create(WizardForm);
  InfoPanel.Parent := WizardForm.SelectComponentsPage;
  InfoPanel.Caption := '';
  InfoPanel.Top := WizardForm.ComponentsList.Top;
  InfoPanel.Left := ScaleX(216);
  InfoPanel.Width := ScaleX(200);
  InfoPanel.Height := WizardForm.ComponentsList.Height;
  InfoPanel.BevelInner := bvRaised;
  InfoPanel.BevelOuter := bvLowered;
  InfoCaption := TNewStaticText.Create(WizardForm);
  InfoCaption.Parent := WizardForm.SelectComponentsPage;
  InfoCaption.Caption := '����';
  InfoCaption.Left := ScaleX(224);
  InfoCaption.Top := InfoPanel.Top - ScaleY(5);
  InfoCaption.Font.Color := clActiveCaption;
  // ������������
  Info := TNewStaticText.Create(WizardForm);
  Info.Parent := InfoPanel;
  Info.AutoSize := False;
  Info.Left := ScaleX(6);
  Info.Width := ScaleX(188);
  Info.Top := ScaleY(12);
  Info.Height := WizardForm.ComponentsList.Height - ScaleY(18);
  Info.Caption := '�ƶ�������ָ�뵽���֮�ϣ���ɼ�������������';
  Info.WordWrap := true;
  //������������
  enabledesc(WizardForm.ComponentsList.Handle,Info.Handle,
       '�����ļ�����;'+
       '�����ļ�����;'+
       '�����ļ�����;'+
       'Ӣ������;'+
       '��������;'+
       '��������;'+
       '������������#3B#3B����#3BӢ�ķֺ�;'+
       '��������;'+
       '����1����;'+
       '����2����;'+
       '����3����;'+
       '����4����;'+
       '����5����;'+
       '����6����;'
       );
end;





