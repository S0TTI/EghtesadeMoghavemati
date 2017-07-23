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
'	These global variables will be declared once when the Application starts.
''	These variables can be accessed from all modules.
	Dim	sql1 As SQL
	Dim cr1 As Cursor
End Sub

Sub Globals
'	These global variables will be redeclared each time the activity is created.
	Private Label1 As Label
	Private Panel1 As Panel

	Private sampletext As Label
	Private textsizeSeekBar As SeekBar
	Private textsizenum As Label
	Private textsizelbl As Label
	Dim selectfontspin As Spinner
	Private selectfontlbl As Label
	Dim alltextsize = 30 As Int
	Dim alltextfont =Typeface.LoadFromAssets("font3.ttf") As Typeface 
	Private savebtn As Button
	Private defultbtn As Button
	Private Panel2 As Panel
	Private settingbtn As Button
	Dim position1spin As Int = 2
	Private connecttousbtn As Button
	Private Panel3 As Panel
	Private Label5 As Label
	Private Label4 As Label
	Private Label2 As Label
	Private Label3 As Label
	Private infobtn As Button
	Private infoscrol As ScrollView
	Private infotxtlbl As Label
	Private infopnl As Panel
	Dim stringutil As StringUtils
	

	Private moghavematiImg As ImageView
	Private imgserajlogo As ImageView
End Sub

Sub Activity_Create(FirstTime As Boolean)
'	Do Not forget To load the layout File created with the visual designer. For example:
	Activity.LoadLayout("mainpagelayout")	
	Panel1.Visible=False
	Panel2.Visible=True
	Panel3.Visible = False
	infopnl.Visible = False
	
	If File.Exists(File.DirInternal,"db1.db") = False Then
	File.Copy(File.DirAssets,"db1.db",File.DirInternal,"db1.db")
	End If
	sql1.Initialize(File.DirInternal,"db1.db",False)
	
	cr1 = sql1.ExecQuery("SELECT * FROM table1")
	
' لود شدن تنظیمات پنل اصلی
	mainepanel	
	
End Sub

''======پنل اصلی========'
Sub mainepanel
	infotxtlbl.Initialize("infotxtlbl")
	infoscrol.Panel.AddView(infotxtlbl,0,0,infoscrol.Width,100)
	defultbtn_Click
	infotxtlbl.TextColor = Colors.Black
	infotxtlbl.Gravity = Gravity.CENTER_HORIZONTAL
End Sub
''======پنل تنظیمات======='
Sub settingpanl1 
	Panel1.SetVisibleAnimated(1000,True)
	Panel2.SetVisibleAnimated(1000,False)
	Panel1.Top = 0%y
	Panel1.Height = 100%y
	Panel1.Left = 0%x
	Panel1.Width = 100%x
	
	Label1.Top = Panel1.Top
	Label1.Height = 5%y
	Label1.Left = Panel1.Left
	Label1.Width = Panel1.Width
	Label1.TextSize = 1%x + 1%y 
	Label1.Gravity = Gravity.CENTER_HORIZONTAL
	
	selectfontlbl.Top = Label1.Top+Label1.Height+30dip
	selectfontlbl.Height = 50dip
	selectfontlbl.Left = Panel1.Left
	selectfontlbl.Width = Panel1.Width
	selectfontlbl.Text = "فونت"
	selectfontlbl.TextSize = 30
	selectfontlbl.Gravity = Gravity.CENTER_HORIZONTAL
	selectfontlbl.TextColor = Colors.White
	
	selectfontspin.Top = selectfontlbl.Top+selectfontlbl.Height+30dip
	selectfontspin.Height = 10%y
	selectfontspin.Left = 30%x
	selectfontspin.Width = 30%x
	selectfontspin.AddAll(Array As String("فونت یک","فونت دو","فونت سه","فونت چهار","فونت پنج","فونت شش","فونت هفت","فونت هشت","فونت نه","فونت ده"))
	selectfontspin.SelectedIndex = position1spin
	
	textsizelbl.Top = 50%y-20dip
	textsizelbl.Height =50dip
	textsizelbl.Left = Panel1.Left
	textsizelbl.Width = Panel1.Width
	textsizelbl.Text = "اندازه متن"
	textsizelbl.TextSize = 30
	textsizelbl.TextColor = Colors.White
	textsizelbl.Gravity = Gravity.CENTER_HORIZONTAL
	
	textsizenum.Top = textsizelbl.Top+textsizelbl.Height
	textsizenum.Height = 50dip
	textsizenum.Left = Panel1.Left
	textsizenum.Width = Panel1.Width
	textsizenum.TextSize = 30
	textsizenum.TextColor = Colors.White
	textsizenum.Gravity = Gravity.CENTER_HORIZONTAL
	textsizenum.Text = textsizeSeekBar.Value
	
	textsizeSeekBar.Top = textsizenum.Top+10dip
	textsizeSeekBar.Left = 20%x
	textsizeSeekBar.Width = 60%x

	sampletext.Left = Panel1.Left+50dip
	sampletext.Width = (Panel1.Width  - 100dip)
	sampletext.Top = textsizeSeekBar.Top + 50
	sampletext.Height = 100%y - sampletext.Top	
	
	defultbtn.Left = Panel1.Left + 5dip
	defultbtn.Width = 36%x
	defultbtn.Top = Panel1.Top +5dip
	defultbtn.Height = 9%y
	defultbtn.Text = "تظیمات پیش فرض"
	defultbtn.TextSize = 18
	
	savebtn.Width = 35%x
	savebtn.Left = 100%x - 36%X 
	savebtn.Top = Panel1.Top + 5dip
	savebtn.Height = 9%y
	savebtn.Text = "ذخیره و خروج"
	
End Sub

Sub Activity_Resume

End Sub

Sub Activity_Pause (UserClosed As Boolean)

End Sub
'سیک بار سایز متن
Sub textsizeSeekBar_ValueChanged (Value As Int, UserChanged As Boolean)
	textsizenum.Text = textsizeSeekBar.Value
	sampletext.TextSize = textsizeSeekBar.Value
End Sub
''کلید تنظیمات پیش فرض
Sub defultbtn_Click
	textsizenum.Text = 30
	textsizeSeekBar.Value = textsizenum.Text
	sampletext.TextSize = textsizenum.Text
	alltextfont = Typeface.LoadFromAssets("font3.ttf")
	selectfontspin.SelectedIndex = 3
End Sub
''کلید ذخیره تنظیمات
Sub savebtn_Click
	alltextfont = sampletext.Typeface
	alltextsize = sampletext.TextSize
	Panel1.SetVisibleAnimated(1000,False)	
	Panel2.SetVisibleAnimated(20,True)
	infotxtlbl.TextSize = alltextsize
	infotxtlbl.Typeface = alltextfont 
End Sub
''اسپینر انتخاب فونت
Sub selectfontspin_ItemClick (Position As Int, Value As Object)
	Select Position+1
		Case 1
			sampletext.Typeface = Typeface.LoadFromAssets("font1.ttf")
		Case 2
			sampletext.Typeface = Typeface.LoadFromAssets("font2.ttf")
		Case 3
			sampletext.Typeface = Typeface.LoadFromAssets("font3.ttf")
		Case 4
			sampletext.Typeface = Typeface.LoadFromAssets("font4.ttf")
		Case 5
			sampletext.Typeface = Typeface.LoadFromAssets("font5.ttf")
		Case 6
			sampletext.Typeface = Typeface.LoadFromAssets("font6.ttf")
		Case 7
			sampletext.Typeface = Typeface.LoadFromAssets("font7.ttf")
		Case 8
			sampletext.Typeface = Typeface.LoadFromAssets("font8.ttf")
		Case 9
			sampletext.Typeface = Typeface.LoadFromAssets("font9.ttf")
		Case 10
			sampletext.Typeface = Typeface.LoadFromAssets("font10.ttf")
	End Select
	position1spin = Position
	
End Sub
''درصورت کلیک شدن رو دکمه تنظیمات
Sub settingbtn_Click
	settingpanl1
End Sub
''درصورت کلیک شدن روی کلید ارتباط با ما
Sub connecttousbtn_Click
	Panel3.Height = 50%y
	Panel3.Width = 50%y
	Panel3.Left = 50%x - Panel3.Height/2
	Panel3.Top = 50%y - Panel3.Height/2

	Label4.Height = 8%y
	Label4.Width = Panel3.Width
	Label4.Left = 0
	Label4.Top = 5dip

	Label2.Height = 8%y
	Label2.Width = Panel3.Width
	Label2.Left = 0
	Label2.Top = 8%y + 15dip

	Label5.Text= Chr(0xf2b6)
	Label5.Height = 8%y
	Label5.Width = 6%x
	Label5.Left = 5dip
	Label5.Top = 22%y

	Label3.Height = 8%y
	Label3.Width = Panel3.Width
	Label3.Left = Label5.Left + Label5.Width
	Label3.Top = Label5.Top
	
	
	
	Panel3.SetVisibleAnimated(2000,True)
End Sub
'درصورت کلیک شدن روی پنل اصلی و باز بودن پنل ارتباط با ما
Sub Panel2_Click
	If Panel3.Visible == True Then
		Panel3.SetVisibleAnimated(1000,False)
	End If
End Sub
'کلید در باره ما
Sub infobtn_Click
	cr1.Position=0
	infotxtlbl.Text = cr1.GetString("text")
	infotxtlbl.Height = stringutil.MeasureMultilineTextHeight(infotxtlbl,infotxtlbl.Text)
	infoscrol.Panel.Height = infotxtlbl.Height
	infopnl.SetVisibleAnimated(100,True)
	
End Sub

Sub btnrhbari_Click
	cr1.Position=1
	imgserajlogo.Bitmap = LoadBitmap(File.DirAssets,"eghtimg.png") 
	infotxtlbl.Text = cr1.GetString("text")
	infotxtlbl.Height = stringutil.MeasureMultilineTextHeight(infotxtlbl,infotxtlbl.Text)
	infoscrol.Panel.Height = infotxtlbl.Height
	infopnl.SetVisibleAnimated(100,True)
End Sub

Sub btneghtasaddan_Click
	cr1.Position=2
	imgserajlogo.Bitmap = LoadBitmap(File.DirAssets,"eghtimg.png") 
	infotxtlbl.Text = cr1.GetString("text")
	infotxtlbl.Height = stringutil.MeasureMultilineTextHeight(infotxtlbl,infotxtlbl.Text)
	infoscrol.Panel.Height = infotxtlbl.Height
	infopnl.SetVisibleAnimated(100,True)
End Sub

Sub btnphotogalery_Click
	StartActivity("galery")
End Sub

Sub closeinfopnl_Click
	infopnl.SetVisibleAnimated(100,False)
End Sub

Sub videoview_Click
	StartActivity("video")
End Sub

Sub btnshare_Click
	Dim share As Intent
	share.Initialize(share.ACTION_SEND,"")
	share.SetType("text/plain")
	share.PutExtra("android.intent.extra.TEXT", infotxtlbl.Text)
	share.WrapAsIntentChooser("اشتراک بگذاريد")
	StartActivity(share)
End Sub