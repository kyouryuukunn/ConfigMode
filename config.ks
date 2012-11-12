*initialize

; 右クリックでコンフィグ画面を閉じられるように右クリックの設定を変更します
@rclick jump=true storage="config.ks" target=*back enabled=true
; 現在の状態をメモリ上の栞に保存しておきます
@tempsave place=0
;開始時サブルーチンを呼ぶ
@call storage=&config_plugin_obj.start_sub_storage target=&config_plugin_obj.start_sub_label

@iscript
// システムボタンを使っているなら消去
if(typeof(global.exsystembutton_object) != "undefined" && kag.fore.messages[0].visible)
	exsystembutton_object.onMessageHiddenStateChanged(true);
//SetMessageOpacityを使っているなら消去
if (typeof(global.SetMessageOpacity_object) != 'undefined' && kag.fore.messages[0].visible)
	SetMessageOpacity_object.onMessageHiddenStateChanged(true);
// 全てのメッセージレイヤを非表示にします
for(var i=0;i<kag.numMessageLayers;i++)
	kag.fore.messages[i].setOptions(%["visible" => false]);
//マウスを中心に移動
kag.fore.base.cursorX = kag.scWidth/2;
kag.fore.base.cursorY = kag.scHeight/2;
@endscript


; レイヤを必要な数確保します
@laycount layers="&kag.numCharacterLayers + 1" messages="&kag.numMessageLayers + 1"
@layopt index="&2000000+100" layer="&kag.numCharacterLayers - 1"
@layopt index="&2000000+200" layer="&kag.numMessageLayers - 1"
; 背景
@image layer="&kag.numCharacterLayers-1" storage=&config_plugin_obj.back page=fore visible=true
; メッセージレイヤの設定をします
@history enabled=false output=false
@current layer="&'message' + (kag.numMessageLayers - 1)"
@position opacity=0 marginb=0 marginl=0 marginr=0 margint=0 left=0 top=0 width=&kag.scWidth height=&kag.scHeight visible=true
;閉じるボタン
@locate x=&config_plugin_obj.close_x y=&config_plugin_obj.close_y
@button storage=config.ks target=*back graphic=&config_plugin_obj.close_button



; ボタン設定
@iscript
var config_togglebutton = [];
for (var i = 0; i < 21; i++){
	config_togglebutton[i] = new KToggleButtonLayer(kag, kag.fore.layers[kag.numCharacterLayers-1]);
}
config_togglebutton[0].setOptions(  %[visible:config_plugin_obj.button_01_visible, left:config_plugin_obj.button_01_pos[0], top:config_plugin_obj.button_01_pos[1], oncheck:'config_plugin_obj.button_01 = 1', onuncheck:'config_plugin_obj.button_01 = 0', graphic:config_plugin_obj.graphic, checked:config_plugin_obj.button_01]);
config_togglebutton[1].setOptions(  %[visible:config_plugin_obj.button_02_visible, left:config_plugin_obj.button_02_pos[0], top:config_plugin_obj.button_02_pos[1], oncheck:'config_plugin_obj.button_02 = 1', onuncheck:'config_plugin_obj.button_02 = 0', graphic:config_plugin_obj.graphic, checked:config_plugin_obj.button_02]);
config_togglebutton[2].setOptions(  %[visible:config_plugin_obj.button_03_visible, left:config_plugin_obj.button_03_pos[0], top:config_plugin_obj.button_03_pos[1], oncheck:'config_plugin_obj.button_03 = 1', onuncheck:'config_plugin_obj.button_03 = 0', graphic:config_plugin_obj.graphic, checked:config_plugin_obj.button_03]);
config_togglebutton[3].setOptions(  %[visible:config_plugin_obj.button_04_visible, left:config_plugin_obj.button_04_pos[0], top:config_plugin_obj.button_04_pos[1], oncheck:'config_plugin_obj.button_04 = 1', onuncheck:'config_plugin_obj.button_04 = 0', graphic:config_plugin_obj.graphic, checked:config_plugin_obj.button_04]);
config_togglebutton[4].setOptions(  %[visible:config_plugin_obj.button_05_visible, left:config_plugin_obj.button_05_pos[0], top:config_plugin_obj.button_05_pos[1], oncheck:'config_plugin_obj.button_05 = 1', onuncheck:'config_plugin_obj.button_05 = 0', graphic:config_plugin_obj.graphic, checked:config_plugin_obj.button_05]);
config_togglebutton[5].setOptions(  %[visible:config_plugin_obj.button_06_visible, left:config_plugin_obj.button_06_pos[0], top:config_plugin_obj.button_06_pos[1], oncheck:'config_plugin_obj.button_06 = 1', onuncheck:'config_plugin_obj.button_06 = 0', graphic:config_plugin_obj.graphic, checked:config_plugin_obj.button_06]);
config_togglebutton[6].setOptions(  %[visible:config_plugin_obj.button_07_visible, left:config_plugin_obj.button_07_pos[0], top:config_plugin_obj.button_07_pos[1], oncheck:'config_plugin_obj.button_07 = 1', onuncheck:'config_plugin_obj.button_07 = 0', graphic:config_plugin_obj.graphic, checked:config_plugin_obj.button_07]);
config_togglebutton[7].setOptions(  %[visible:config_plugin_obj.button_08_visible, left:config_plugin_obj.button_08_pos[0], top:config_plugin_obj.button_08_pos[1], oncheck:'config_plugin_obj.button_08 = 1', onuncheck:'config_plugin_obj.button_08 = 0', graphic:config_plugin_obj.graphic, checked:config_plugin_obj.button_08]);
config_togglebutton[8].setOptions(  %[visible:config_plugin_obj.button_09_visible, left:config_plugin_obj.button_09_pos[0], top:config_plugin_obj.button_09_pos[1], oncheck:'config_plugin_obj.button_09 = 1', onuncheck:'config_plugin_obj.button_09 = 0', graphic:config_plugin_obj.graphic, checked:config_plugin_obj.button_09]);
config_togglebutton[9].setOptions(  %[visible:config_plugin_obj.button_10_visible, left:config_plugin_obj.button_10_pos[0], top:config_plugin_obj.button_10_pos[1], oncheck:'config_plugin_obj.button_10 = 1', onuncheck:'config_plugin_obj.button_10 = 0', graphic:config_plugin_obj.graphic, checked:config_plugin_obj.button_10]);
config_togglebutton[10].setOptions( %[visible:config_plugin_obj.button_11_visible, left:config_plugin_obj.button_11_pos[0], top:config_plugin_obj.button_11_pos[1], oncheck:'config_plugin_obj.button_11 = 1', onuncheck:'config_plugin_obj.button_11 = 0', graphic:config_plugin_obj.graphic, checked:config_plugin_obj.button_11]);
config_togglebutton[11].setOptions( %[visible:config_plugin_obj.button_12_visible, left:config_plugin_obj.button_12_pos[0], top:config_plugin_obj.button_12_pos[1], oncheck:'config_plugin_obj.button_12 = 1', onuncheck:'config_plugin_obj.button_12 = 0', graphic:config_plugin_obj.graphic, checked:config_plugin_obj.button_12]);
config_togglebutton[12].setOptions( %[visible:config_plugin_obj.button_13_visible, left:config_plugin_obj.button_13_pos[0], top:config_plugin_obj.button_13_pos[1], oncheck:'config_plugin_obj.button_13 = 1', onuncheck:'config_plugin_obj.button_13 = 0', graphic:config_plugin_obj.graphic, checked:config_plugin_obj.button_13]);
config_togglebutton[13].setOptions( %[visible:config_plugin_obj.button_14_visible, left:config_plugin_obj.button_14_pos[0], top:config_plugin_obj.button_14_pos[1], oncheck:'config_plugin_obj.button_14 = 1', onuncheck:'config_plugin_obj.button_14 = 0', graphic:config_plugin_obj.graphic, checked:config_plugin_obj.button_14]);
config_togglebutton[14].setOptions( %[visible:config_plugin_obj.button_15_visible, left:config_plugin_obj.button_15_pos[0], top:config_plugin_obj.button_15_pos[1], oncheck:'config_plugin_obj.button_15 = 1', onuncheck:'config_plugin_obj.button_15 = 0', graphic:config_plugin_obj.graphic, checked:config_plugin_obj.button_15]);
config_togglebutton[15].setOptions( %[visible:config_plugin_obj.button_16_visible, left:config_plugin_obj.button_16_pos[0], top:config_plugin_obj.button_16_pos[1], oncheck:'config_plugin_obj.button_16 = 1', onuncheck:'config_plugin_obj.button_16 = 0', graphic:config_plugin_obj.graphic, checked:config_plugin_obj.button_16]);
config_togglebutton[16].setOptions( %[visible:config_plugin_obj.button_17_visible, left:config_plugin_obj.button_17_pos[0], top:config_plugin_obj.button_17_pos[1], oncheck:'config_plugin_obj.button_17 = 1', onuncheck:'config_plugin_obj.button_17 = 0', graphic:config_plugin_obj.graphic, checked:config_plugin_obj.button_17]);
config_togglebutton[17].setOptions( %[visible:config_plugin_obj.button_18_visible, left:config_plugin_obj.button_18_pos[0], top:config_plugin_obj.button_18_pos[1], oncheck:'config_plugin_obj.button_18 = 1', onuncheck:'config_plugin_obj.button_18 = 0', graphic:config_plugin_obj.graphic, checked:config_plugin_obj.button_18]);
config_togglebutton[18].setOptions( %[visible:config_plugin_obj.button_19_visible, left:config_plugin_obj.button_19_pos[0], top:config_plugin_obj.button_19_pos[1], oncheck:'config_plugin_obj.button_19 = 1', onuncheck:'config_plugin_obj.button_19 = 0', graphic:config_plugin_obj.graphic, checked:config_plugin_obj.button_19]);
config_togglebutton[19].setOptions( %[visible:config_plugin_obj.button_20_visible, left:config_plugin_obj.button_20_pos[0], top:config_plugin_obj.button_20_pos[1], oncheck:'config_plugin_obj.button_20 = 1', onuncheck:'config_plugin_obj.button_20 = 0', graphic:config_plugin_obj.graphic, checked:config_plugin_obj.button_20]);
// ウィンドウモード切り替え
config_togglebutton[20].setOptions( %[visible:config_plugin_obj.window_button_visible, left:config_plugin_obj.window_button_pos[0], top:config_plugin_obj.window_button_pos[1], checkstorage:'config.ks', uncheckstorage:'config.ks', checktarget:'*windowmode', unchecktarget:'*windowmode', graphic:config_plugin_obj.graphic, checked:kag.fullScreened]);

// ◆スライダー設定
tf.config_slider = new Array();
for (var i=0; i < 20; i++){
	tf.config_slider[i] = new KSliderLayer(kag, kag.fore.layers[kag.numCharacterLayers - 1]);
	with(tf.config_slider[i]){
		.setOptions(%['graphic' => config_plugin_obj.slider_base, 'tabgraphic' => config_plugin_obj.slider_tab]);
	}
}
with(tf.config_slider[0]){  .visible = config_plugin_obj.slider_01_visible; .left = config_plugin_obj.slider_01_pos[0]; .top =  config_plugin_obj.slider_01_pos[1]; .hval = config_plugin_obj.slider_01; .onchangefunc = 'config_plugin_obj.slider_01_func'; .updateState(); }
with(tf.config_slider[1]){  .visible = config_plugin_obj.slider_02_visible; .left = config_plugin_obj.slider_02_pos[0]; .top =  config_plugin_obj.slider_02_pos[1]; .hval = config_plugin_obj.slider_02; .onchangefunc = 'config_plugin_obj.slider_02_func'; .updateState(); }
with(tf.config_slider[2]){  .visible = config_plugin_obj.slider_03_visible; .left = config_plugin_obj.slider_03_pos[0]; .top =  config_plugin_obj.slider_03_pos[1]; .hval = config_plugin_obj.slider_03; .onchangefunc = 'config_plugin_obj.slider_03_func'; .updateState(); }
with(tf.config_slider[3]){  .visible = config_plugin_obj.slider_04_visible; .left = config_plugin_obj.slider_04_pos[0]; .top =  config_plugin_obj.slider_04_pos[1]; .hval = config_plugin_obj.slider_04; .onchangefunc = 'config_plugin_obj.slider_04_func'; .updateState(); }
with(tf.config_slider[4]){  .visible = config_plugin_obj.slider_05_visible; .left = config_plugin_obj.slider_05_pos[0]; .top =  config_plugin_obj.slider_05_pos[1]; .hval = config_plugin_obj.slider_05; .onchangefunc = 'config_plugin_obj.slider_05_func'; .updateState(); }
with(tf.config_slider[5]){  .visible = config_plugin_obj.slider_06_visible; .left = config_plugin_obj.slider_06_pos[0]; .top =  config_plugin_obj.slider_06_pos[1]; .hval = config_plugin_obj.slider_06; .onchangefunc = 'config_plugin_obj.slider_06_func'; .updateState(); }
with(tf.config_slider[6]){  .visible = config_plugin_obj.slider_07_visible; .left = config_plugin_obj.slider_07_pos[0]; .top =  config_plugin_obj.slider_07_pos[1]; .hval = config_plugin_obj.slider_07; .onchangefunc = 'config_plugin_obj.slider_07_func'; .updateState(); }
with(tf.config_slider[7]){  .visible = config_plugin_obj.slider_08_visible; .left = config_plugin_obj.slider_08_pos[0]; .top =  config_plugin_obj.slider_08_pos[1]; .hval = config_plugin_obj.slider_08; .onchangefunc = 'config_plugin_obj.slider_08_func'; .updateState(); }
with(tf.config_slider[8]){  .visible = config_plugin_obj.slider_09_visible; .left = config_plugin_obj.slider_09_pos[0]; .top =  config_plugin_obj.slider_09_pos[1]; .hval = config_plugin_obj.slider_09; .onchangefunc = 'config_plugin_obj.slider_09_func'; .updateState(); }
with(tf.config_slider[9]){  .visible = config_plugin_obj.slider_10_visible; .left = config_plugin_obj.slider_10_pos[0]; .top =  config_plugin_obj.slider_10_pos[1]; .hval = config_plugin_obj.slider_10; .onchangefunc = 'config_plugin_obj.slider_10_func'; .updateState(); }
with(tf.config_slider[10]){ .visible = config_plugin_obj.slider_11_visible; .left = config_plugin_obj.slider_11_pos[0]; .top =  config_plugin_obj.slider_11_pos[1]; .hval = config_plugin_obj.slider_11; .onchangefunc = 'config_plugin_obj.slider_11_func'; .updateState(); }
with(tf.config_slider[11]){ .visible = config_plugin_obj.slider_12_visible; .left = config_plugin_obj.slider_12_pos[0]; .top =  config_plugin_obj.slider_12_pos[1]; .hval = config_plugin_obj.slider_12; .onchangefunc = 'config_plugin_obj.slider_12_func'; .updateState(); }
with(tf.config_slider[12]){ .visible = config_plugin_obj.slider_13_visible; .left = config_plugin_obj.slider_13_pos[0]; .top =  config_plugin_obj.slider_13_pos[1]; .hval = config_plugin_obj.slider_13; .onchangefunc = 'config_plugin_obj.slider_13_func'; .updateState(); }
with(tf.config_slider[13]){ .visible = config_plugin_obj.slider_14_visible; .left = config_plugin_obj.slider_14_pos[0]; .top =  config_plugin_obj.slider_14_pos[1]; .hval = config_plugin_obj.slider_14; .onchangefunc = 'config_plugin_obj.slider_14_func'; .updateState(); }
with(tf.config_slider[14]){ .visible = config_plugin_obj.slider_15_visible; .left = config_plugin_obj.slider_15_pos[0]; .top =  config_plugin_obj.slider_15_pos[1]; .hval = config_plugin_obj.slider_15; .onchangefunc = 'config_plugin_obj.slider_15_func'; .updateState(); }
with(tf.config_slider[15]){ .visible = config_plugin_obj.slider_16_visible; .left = config_plugin_obj.slider_16_pos[0]; .top =  config_plugin_obj.slider_16_pos[1]; .hval = config_plugin_obj.slider_16; .onchangefunc = 'config_plugin_obj.slider_16_func'; .updateState(); }
with(tf.config_slider[16]){ .visible = config_plugin_obj.slider_17_visible; .left = config_plugin_obj.slider_17_pos[0]; .top =  config_plugin_obj.slider_17_pos[1]; .hval = config_plugin_obj.slider_17; .onchangefunc = 'config_plugin_obj.slider_17_func'; .updateState(); }
with(tf.config_slider[17]){ .visible = config_plugin_obj.slider_18_visible; .left = config_plugin_obj.slider_18_pos[0]; .top =  config_plugin_obj.slider_18_pos[1]; .hval = config_plugin_obj.slider_18; .onchangefunc = 'config_plugin_obj.slider_18_func'; .updateState(); }
with(tf.config_slider[18]){ .visible = config_plugin_obj.slider_19_visible; .left = config_plugin_obj.slider_19_pos[0]; .top =  config_plugin_obj.slider_19_pos[1]; .hval = config_plugin_obj.slider_19; .onchangefunc = 'config_plugin_obj.slider_19_func'; .updateState(); }
with(tf.config_slider[19]){ .visible = config_plugin_obj.slider_20_visible; .left = config_plugin_obj.slider_20_pos[0]; .top =  config_plugin_obj.slider_20_pos[1]; .hval = config_plugin_obj.slider_20; .onchangefunc = 'config_plugin_obj.slider_20_func'; .updateState(); }
@endscript


@s
; ここから先が各サブルーチン

; ウィンドウモードの「フルスクリーン」をクリックした時に実行されるスクリプト
; 即座に反応させたいのでこれだけ別
*windowmode
@eval exp="kag.fullScreened ? kag.onWindowedMenuItemClick() : kag.onFullScreenMenuItemClick()"
@s

; コンフィグ画面を閉じます
*back
;終了時サブルーチンを呼ぶ
@call storage=&config_plugin_obj.close_sub_storage target=&config_plugin_obj.close_sub_label
; コンフィグ画面表示前の状態を復元します(但し BGM は復元しません)
@tempload place=0 bgm=false
; メッセージ履歴の出力・表示を有効にします(但しセーブ不可ならタイトル画面と判断)
@history output=true enabled=true cond="kag.canStore()"

@iscript
// システムボタンを使っていて、コンフィグ画面を表示する前にメッセージレイヤが表示されていた時は onMessageHiddenStateChanged を呼び出します
if(typeof(global.exsystembutton_object) != "undefined" && kag.fore.messages[0].visible)
	exsystembutton_object.onMessageHiddenStateChanged(false);
if (typeof(global.SetMessageOpacity_object) != 'undefined' && kag.fore.messages[0].visible)
	SetMessageOpacity_object.onMessageHiddenStateChanged(false);
@endscript

@current layer=message0
@return
