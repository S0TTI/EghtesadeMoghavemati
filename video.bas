Type=Activity
Version=6.3
ModulesStructureVersion=1
B4A=true
@EndOfDesignText@
#Region  Activity Attributes 
	#FullScreen: true
	#IncludeTitle: false
#End Region

Sub Process_Globals
	'These global variables will be declared once when the application starts.
	'These variables can be accessed from all modules.
	Dim t1 As Timer
End Sub

Sub Globals
	'These global variables will be redeclared each time the activity is created.
	'These variables can only be accessed from this module.

	Private koltimlbl As Label
	Private timevideolbl As Label
	Private videoviwepnl As Panel
	Dim videoplyer As VideoView
	Private plyabtn As Button
	Private pusebtn As Button
	Private lblvolum As Label
	Private videoSkbr As SeekBar
	Private skbrvolume As SeekBar
 End Sub

Sub Activity_Create(FirstTime As Boolean)
	'Do not forget to load the layout file created with the visual designer. For example:
	Activity.LoadLayout("videov")
	plyabtn.Typeface = Typeface.LoadFromAssets("fontawesome-webfont.ttf")
	pusebtn.Typeface = Typeface.LoadFromAssets("fontawesome-webfont.ttf")
	plyabtn.Text = Chr(0xf144)
	pusebtn.Text = Chr(0xf28e)
	lblvolum.Typeface = Typeface.LoadFromAssets("fontawesome-webfont.ttf")
	lblvolum.Text = Chr(0xf028)
	File.Copy(File.DirAssets,"a1.mp4",File.DirInternal,"a1.mp4")
	t1.Initialize("t1",1000)
	videoplyer.Initialize("videoplyer")
	videoplyer.MediaControllerEnabled = False
	videoviwepnl.AddView(videoplyer,0,videoviwepnl.Height/2 - 25dip,videoviwepnl.Width,videoviwepnl.Height)
	videoplyer.LoadVideo(File.DirInternal,"a1.mp4")	
End Sub

Sub Activity_Resume

End Sub

Sub Activity_Pause (UserClosed As Boolean)

End Sub

Sub ConvertToTimeFormat(ms As Int) As String
	Dim seconds,minuts As Int
	seconds = Round(ms/1000)
	minuts = Floor(seconds/60)
	seconds = seconds Mod 60
	Return NumberFormat(minuts,1,0)& ":" & NumberFormat(seconds,2,0) 'ex : 3:05
End Sub

Sub vida6lbl_Click
	pusebtn_Click
	ToastMessageShow("لطفا به اینترنت متصل باشید ویدیو از سایت منبع پخش می شود لطفا شکیبا باشید",True)
	videoplyer.LoadVideo("http","http://hw15.asset.aparat.com/aparat-video/30d8fda24435a499811dde2220ba8a1e4906479-360p__92534.mp4")
	plyabtn_Click
End Sub

Sub vida5lbl_Click
	pusebtn_Click
	ToastMessageShow("لطفا به اینترنت متصل باشید ویدیو از سایت منبع پخش می شود لطفا شکیبا باشید",True)
	videoplyer.LoadVideo("http","http://hw2.asset.aparat.com/aparat-video/2ebbccb1b46e74138a399ae7d0c1d74d4920698-360p__95910.mp4")
	plyabtn_Click
End Sub

Sub vida4lbl_Click
	pusebtn_Click
	ToastMessageShow("لطفا به اینترنت متصل باشید ویدیو از سایت منبع پخش می شود لطفا شکیبا باشید",True)
	videoplyer.LoadVideo("http","http://hw3.asset.aparat.com/aparat-video/22acbb6f712267c33b22f3ca043c9df64906781-360p__97567.mp4")
	plyabtn_Click
End Sub

Sub vida3lbl_Click
	pusebtn_Click
	ToastMessageShow("لطفا به اینترنت متصل باشید ویدیو از سایت منبع پخش می شود لطفا شکیبا باشید",True)
	videoplyer.LoadVideo("http","http://hw4.asset.aparat.com/aparat-video/b2e58a630cffa119c454b9bc55af12f61020133__31263.mp4")
	plyabtn_Click
End Sub

Sub vida2lbl_Click
	pusebtn_Click
	ToastMessageShow("لطفا به اینترنت متصل باشید ویدیو از سایت منبع پخش می شود لطفا شکیبا باشید",True)
	videoplyer.LoadVideo("http","http://hw15.asset.aparat.com/aparat-video/85ea850155d97f2c0c7ae47aa39fa7263540202-720p__86192.mp4")
	plyabtn_Click
End Sub


Sub vida1lbl_Click
	pusebtn_Click
	videoplyer.LoadVideo(File.DirInternal,"a1.mp4")	
	plyabtn_Click
End Sub

Sub videoSkbr_ValueChanged (Value As Int, UserChanged As Boolean)
	If UserChanged Then
		videoplyer.Position = Value/100*videoplyer.Duration
	End If
End Sub

Sub skbrvolume_ValueChanged (Value As Int, UserChanged As Boolean)
	Public ph As Phone
	ph.SetVolume(ph.VOLUME_MUSIC,Value*(ph.GetMaxVolume(ph.VOLUME_MUSIC)/100), False)
	If UserChanged Then
		ph.SetVolume(ph.VOLUME_MUSIC,Value*(ph.GetMaxVolume(ph.VOLUME_MUSIC)/100),False)
	End If
	
End Sub

Sub T1_Tick
	videoSkbr.Value = (videoplyer.Position/videoplyer.Duration)*100
	timevideolbl.Text = ConvertToTimeFormat(videoplyer.Position)
	koltimlbl.Text = ConvertToTimeFormat(videoplyer.Duration)
	
End Sub

Sub pusebtn_Click
	videoplyer.Pause
	t1.Enabled = False
End Sub

Sub plyabtn_Click
	videoplyer.Play
	t1.Enabled = True
End Sub