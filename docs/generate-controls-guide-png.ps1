Add-Type -AssemblyName System.Drawing

$Root = Split-Path -Parent (Split-Path -Parent $MyInvocation.MyCommand.Path)
$Out = Join-Path $Root 'docs\trycode-controls-guide.png'

$W = 1800
$H = 2400
$Bitmap = [System.Drawing.Bitmap]::new($W, $H)
$G = [System.Drawing.Graphics]::FromImage($Bitmap)
$G.SmoothingMode = [System.Drawing.Drawing2D.SmoothingMode]::AntiAlias
$G.TextRenderingHint = [System.Drawing.Text.TextRenderingHint]::ClearTypeGridFit

function C($Hex) { [System.Drawing.ColorTranslator]::FromHtml($Hex) }
function Brush($Hex) { [System.Drawing.SolidBrush]::new((C $Hex)) }
function Pen($Hex, $Width = 2) { [System.Drawing.Pen]::new((C $Hex), $Width) }

$G.Clear((C '#fff8eb'))

$Ink = Brush '#2d2016'
$Muted = Brush '#6b5b4c'
$Red = Brush '#b31f24'
$Blue = Brush '#2d5a8a'
$Green = Brush '#2f855a'
$Gold = Brush '#b97813'
$PanelBrush = Brush '#fffdf8'
$LinePen = Pen '#7b4a25' 4
$ThinPen = Pen '#7b4a25' 2
$RulePen = Pen '#ead8b6' 2

$TitleFont = [System.Drawing.Font]::new('Segoe UI Black', 42, [System.Drawing.FontStyle]::Bold)
$HFont = [System.Drawing.Font]::new('Segoe UI Semibold', 24, [System.Drawing.FontStyle]::Bold)
$SubFont = [System.Drawing.Font]::new('Segoe UI', 17)
$SmallFont = [System.Drawing.Font]::new('Segoe UI', 13)
$CodeFont = [System.Drawing.Font]::new('Consolas', 15)
$CodeSmallFont = [System.Drawing.Font]::new('Consolas', 13)

function DrawText($Text, $X, $Y, $Font, $Brush) {
  $G.DrawString([string]$Text, $Font, $Brush, [float]$X, [float]$Y)
}

function DrawCode($Text, $X, $Y, $Small = $false) {
  $Font = if ($Small) { $CodeSmallFont } else { $CodeFont }
  DrawText $Text $X $Y $Font $Blue
}

function RoundRectPath($X, $Y, $W, $H, $R) {
  $Path = [System.Drawing.Drawing2D.GraphicsPath]::new()
  $D = $R * 2
  $Path.AddArc($X, $Y, $D, $D, 180, 90)
  $Path.AddArc($X + $W - $D, $Y, $D, $D, 270, 90)
  $Path.AddArc($X + $W - $D, $Y + $H - $D, $D, $D, 0, 90)
  $Path.AddArc($X, $Y + $H - $D, $D, $D, 90, 90)
  $Path.CloseFigure()
  $Path
}

function DrawPanel($X, $Y, $W, $H, $Title, $AccentHex, $TitleBrush) {
  $Path = RoundRectPath $X $Y $W $H 22
  $G.FillPath($PanelBrush, $Path)
  $G.DrawPath($LinePen, $Path)
  $G.FillRectangle((Brush $AccentHex), $X, $Y, 10, $H)
  DrawText $Title ($X + 24) ($Y + 18) $HFont $TitleBrush
}

function DrawPill($Text, $X, $Y, $W, $FillHex) {
  $Path = RoundRectPath $X $Y $W 34 17
  $G.FillPath((Brush $FillHex), $Path)
  $G.DrawPath($ThinPen, $Path)
  $Format = [System.Drawing.StringFormat]::new()
  $Format.Alignment = [System.Drawing.StringAlignment]::Center
  $Format.LineAlignment = [System.Drawing.StringAlignment]::Center
  $G.DrawString($Text, $SmallFont, $Ink, [System.Drawing.RectangleF]::new($X, $Y, $W, 34), $Format)
}

function DrawCircleLabel($X, $Y, $Top, $Bottom, $FillHex) {
  $G.FillEllipse((Brush $FillHex), $X, $Y, 74, 74)
  $G.DrawEllipse($ThinPen, $X, $Y, 74, 74)
  $Format = [System.Drawing.StringFormat]::new()
  $Format.Alignment = [System.Drawing.StringAlignment]::Center
  $Format.LineAlignment = [System.Drawing.StringAlignment]::Center
  $Bold = [System.Drawing.Font]::new('Segoe UI Semibold', 14, [System.Drawing.FontStyle]::Bold)
  $G.DrawString($Top, $Bold, $Ink, [System.Drawing.RectangleF]::new($X, $Y + 8, 74, 25), $Format)
  $G.DrawString($Bottom, $CodeSmallFont, $Blue, [System.Drawing.RectangleF]::new($X, $Y + 34, 74, 28), $Format)
}

DrawText 'TRYCODE CONTROLS GUIDE' 54 42 $TitleFont $Ink
DrawText 'Runtime input API + keyboard/on-screen/PS5 DualSense mapping' 58 100 $SubFont $Muted
DrawPill 'btn = held' 1280 56 150 '#cdebd1'
DrawPill 'btnp = first frame' 1445 56 220 '#ffe3a3'

DrawPanel 54 150 820 655 'PS5 / Browser Gamepad Mapping' '#b31f24' $Red
$Body = [System.Drawing.Drawing2D.GraphicsPath]::new()
$Body.AddBezier(160,430,170,255,315,252,390,330)
$Body.AddBezier(390,330,430,290,500,290,540,330)
$Body.AddBezier(540,330,615,252,760,255,770,430)
$Body.AddBezier(770,430,790,570,690,610,600,548)
$Body.AddBezier(600,548,540,585,390,585,330,548)
$Body.AddBezier(330,548,240,610,140,570,160,430)
$Body.CloseFigure()
$G.FillPath((Brush '#f7ead2'), $Body)
$G.DrawPath($LinePen, $Body)
$Touch = RoundRectPath 390 342 150 78 14
$G.FillPath((Brush '#e7d2b0'), $Touch)
$G.DrawPath($ThinPen, $Touch)
DrawText 'Touchpad' 430 368 $SmallFont $Muted
DrawPill 'L1 -> btn(8)' 165 206 180 '#ffd6d6'
DrawPill 'R1 -> btn(9)' 585 206 180 '#ffd6d6'
DrawCircleLabel 254 324 'UP' '0' '#cfe9ff'
DrawCircleLabel 254 468 'DOWN' '1' '#cfe9ff'
DrawCircleLabel 180 396 'LEFT' '2' '#cfe9ff'
DrawCircleLabel 328 396 'RIGHT' '3' '#cfe9ff'
DrawCircleLabel 648 324 'Y / TRI' '7' '#f1defd'
DrawCircleLabel 648 468 'A / CROSS' '4' '#d8f5df'
DrawCircleLabel 574 396 'X / SQUARE' '6' '#e0ebff'
DrawCircleLabel 722 396 'B / CIRCLE' '5' '#ffe0df'
$G.FillEllipse((Brush '#d9d1c8'), 302, 535, 96, 96)
$G.DrawEllipse($ThinPen, 302, 535, 96, 96)
DrawText 'Left stick' 315 568 $SmallFont $Ink
DrawCode 'joy(0)' 322 590 $true
$G.FillEllipse((Brush '#d9d1c8'), 532, 535, 96, 96)
$G.DrawEllipse($ThinPen, 532, 535, 96, 96)
DrawText 'Right stick' 538 568 $SmallFont $Ink
DrawCode 'joy(1)' 552 590 $true
DrawPill 'Create / PS -> select btn(10)' 115 656 300 '#fff0bd'
DrawPill 'Options / touchpad -> start btn(11)' 435 656 330 '#fff0bd'
DrawText 'L2/R2 + L3/R3: not exposed by TryCode btn() yet' 215 626 $SmallFont $Red
DrawText 'Standard browser layout used by the app: face 0-3, L1/R1 4-5, D-pad 12-15, axes 0-3.' 92 745 $SmallFont $Muted

DrawPanel 920 150 826 655 'Lua APIs and Accepted Formats' '#2d5a8a' $Blue
$ApiRows = @(
  @('default_controls(mode)', 'modes: "left_joystick" / "joystick" / "left joystick"; "dpad" / "d-pad"; "none" / "off"'),
  @('btn(i_or_name)', 'held input. Use 0-11, directions, a/b/x/y, l1/r1, select/start.'),
  @('btnp(i_or_name)', 'first pressed frame. Use for jump, menu select, toggles, one-shot SFX.'),
  @('joyx(i), joyy(i)', 'i=0 left stick, i=1 right stick. -1 = left/up, +1 = right/down.'),
  @('key(name), keyp(name)', 'held / first-frame keyboard reads. Names are lowercase strings.'),
  @('mouse()', 'returns x,y,buttons,pressed. left/touch=1, middle=2, right=4.')
)
$Y = 218
foreach ($Row in $ApiRows) {
  DrawCode $Row[0] 960 $Y
  DrawText $Row[1] 960 ($Y + 28) $SmallFont $Ink
  $Y += 88
}
DrawText 'Default keyboard-to-btn mapping:' 960 748 $SubFont $Ink
DrawText 'Arrows/WASD -> btn 0-3.  Z/X/C/V -> btn 4-7.' 960 782 $SmallFont $Muted

DrawPanel 54 840 1692 635 'TryCode Virtual Buttons' '#2f855a' $Green
$Headers = @('TryCode', 'Aliases', 'Keyboard', 'On-screen', 'PS5 / Gamepad API')
$Xs = @(82, 230, 650, 875, 1130)
for ($I = 0; $I -lt $Headers.Count; $I++) { DrawText $Headers[$I] $Xs[$I] 908 $SubFont $Green }
$ButtonRows = @(
  @('0', 'up, u', 'ArrowUp / W', 'D-pad up', 'D-pad Up = button[12]'),
  @('1', 'down, d', 'ArrowDown / S', 'D-pad down', 'D-pad Down = button[13]'),
  @('2', 'left, l', 'ArrowLeft / A', 'D-pad left', 'D-pad Left = button[14]'),
  @('3', 'right, r', 'ArrowRight / D', 'D-pad right', 'D-pad Right = button[15]'),
  @('4', 'a', 'Z', 'A button', 'Cross = button[0]'),
  @('5', 'b', 'X', 'B button', 'Circle = button[1]'),
  @('6', 'x', 'C', 'X button', 'Square = button[2]'),
  @('7', 'y', 'V', 'Y button', 'Triangle = button[3]'),
  @('8', 'leftshoulder, lb, l1', '-', '-', 'L1 = button[4]'),
  @('9', 'rightshoulder, rb, r1', '-', '-', 'R1 = button[5]'),
  @('10', 'select, back', '-', 'SELECT', 'Create or PS/center = button[8] or [16]'),
  @('11', 'start', '-', 'START', 'Options or touchpad = button[9] or [17]')
)
$Y = 954
foreach ($Row in $ButtonRows) {
  $G.DrawLine($RulePen, 72, $Y - 8, 1720, $Y - 8)
  DrawCode $Row[0] $Xs[0] $Y
  DrawText $Row[1] $Xs[1] $Y $SmallFont $Ink
  DrawText $Row[2] $Xs[2] $Y $SmallFont $Ink
  DrawText $Row[3] $Xs[3] $Y $SmallFont $Ink
  DrawText $Row[4] $Xs[4] $Y $SmallFont $Ink
  $Y += 37
}

DrawPanel 54 1530 820 420 'key() / keyp() Names' '#b97813' $Gold
$Keys = @(
  'letters: "a"-"z"; digits: "0"-"9" including numpad',
  'movement aliases: "up", "down", "left", "right"',
  'special: "space", "tab", "enter", "escape"/"esc"',
  'editing/nav: "backspace", "delete", "insert", "home", "end", "pageup", "pagedown"',
  'modifiers: "ctrl", "lctrl", "rctrl", "shift", "alt", "meta"',
  'punctuation: -, =, [, ], backslash, semicolon, quote, comma, period, slash, backquote',
  'function keys: usually "f1" through "f12"'
)
$Y = 1602
foreach ($Key in $Keys) {
  DrawText ('- ' + $Key) 92 $Y $SmallFont $Ink
  $Y += 43
}

DrawPanel 920 1530 826 420 'Copy These Patterns' '#b31f24' $Red
$Patterns = @(
  @('Held movement', 'if btn("left") then x -= 1 end'),
  @('First-frame action', 'if btnp("a") then jump() end'),
  @('Stick movement', 'x += joyx(0) * speed'),
  @('Deadzone', 'if abs(joyx(0)) > 0.2 then moving = true end'),
  @('Keyboard fallback', 'if btnp("a") or keyp("z") then select() end'),
  @('Pointer/touch', 'local mx,my,mb,mbr = mouse()')
)
$Y = 1604
foreach ($Pattern in $Patterns) {
  DrawText $Pattern[0] 960 $Y $SmallFont $Muted
  DrawCode $Pattern[1] 1120 $Y $true
  $Y += 55
}

DrawPanel 54 2000 1692 330 'Where the Built-in Examples Use Controls' '#2d5a8a' $Blue
$Examples = @(
  'Scrolling Wall Collision: btn + joyx/joyy movement; btnp(4/5) zoom.',
  'UI + Mouse Studio: default_controls("none"), mouse(), keyp("z/c/v"), btnp("a/x/y/b").',
  'Mushroom Run Platformer: joyx(0), btn("left/right"), btn("b"/"x") sprint, btnp("a") jump.',
  'Basic Menu + Screen Swap: d-pad menus, A/B/X actions, right stick aiming with joyx(1)/joyy(1).',
  '2048 / Tetris / Flappy / Notes: mostly btnp() for grid moves, flap, reset, save/load, and menu actions.',
  'Zelda-like RPG: hybrid d-pad + left stick axis(), A sword, B bow, X bomb, Y talk.'
)
$Y = 2072
foreach ($Example in $Examples) {
  DrawText ('- ' + $Example) 92 $Y $SmallFont $Ink
  $Y += 39
}
DrawText 'Tip: use btn() for continuous movement; use btnp() for one-shot actions. All sources merge into the same virtual buttons.' 92 2300 $SubFont $Red
DrawText 'Generated from index.html runtime input wiring and PS5/Gamepad API references.' 92 2342 $SmallFont $Muted

$Bitmap.Save($Out, [System.Drawing.Imaging.ImageFormat]::Png)
$G.Dispose()
$Bitmap.Dispose()
Write-Output $Out
