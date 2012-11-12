@return cond="typeof(global.config_plugin_obj) != 'undefined'"
@call storage=KLayers.ks

@iscript
if (sf.config_init === void)
{
//初期設定 初回のみ設定したい項目を設定
	sf.config_init = 1;
}

//config_pluginクラスに必要な変数、関数をまとめる
class config_plugin{


	var back = 'config_bg'; // 背景(透明部分には直前のゲーム画面を表示)
	var slider_base = 'slider_base'; // スライダーの背景
	var slider_tab = 'slider_tab';   // スライダーのつまみ(ボタンと同じ構成)
	var graphic = 'graphic';		//トグルボタンの画像を指定(詳しくはKLayers.txtのKToggleButtonLayerを参照, basegraphicはいらないっぽい)
	
	var close_button = 'config_close'; //閉じるボタン
	var close_x = kag.scWidth - 100;   //閉じるボタンのx座標
	var close_y = kag.scHeight - 200;  //閉じるボタンのy座標
	
	//開始時に呼ばれるサブルーチン
	var start_sub_label	= '*config_sub_start'; //ラベル名
	var start_sub_storage	= 'config_sub.ks'; //ファイル名
	//終了時に呼ばれるサブルーチン
	var close_sub_label	= '*config_sub_close'; //ラベル名
	var close_sub_storage	= 'config_sub.ks'; //ファイル名
	
	//ウィンドウモードの切り替えだけは即座に反映したいだろうから
	//先に用意しした
	var window_button_visible	= 1;
	var window_button_pos		= [0, 0];
	
	// 各ボタン、スライダーの操作する変数
	// ボタンはトグルボタンに合わせて0か1
	var button_01 = 0;
	var button_02 = 0;
	var button_03 = 0;
	var button_04 = 0;
	var button_05 = 0;
	var button_06 = 0;
	var button_07 = 0;
	var button_08 = 0;
	var button_09 = 0;
	var button_10 = 0;
	var button_11 = 0;
	var button_12 = 0;
	var button_13 = 0;
	var button_14 = 0;
	var button_15 = 0;
	var button_16 = 0;
	var button_17 = 0;
	var button_18 = 0;
	var button_19 = 0;
	var button_20 = 0;
	
	// スライダーの操作する変数は、
	//スライダーに合わせて0～1まで変化する
	var slider_01 = 0;
	var slider_02 = 0;
	var slider_03 = 0;
	var slider_04 = 0;
	var slider_05 = 0;
	var slider_06 = 0;
	var slider_07 = 0;
	var slider_08 = 0;
	var slider_09 = 0;
	var slider_10 = 0;
	var slider_11 = 0;
	var slider_12 = 0;
	var slider_13 = 0;
	var slider_14 = 0;
	var slider_15 = 0;
	var slider_16 = 0;
	var slider_17 = 0;
	var slider_18 = 0;
	var slider_19 = 0;
	var slider_20 = 0;

	//各ボタン、スライダーを表示するか
	var button_01_visible = 1;
	var button_02_visible = 1;
	var button_03_visible = 1;
	var button_04_visible = 1;
	var button_05_visible = 1;
	var button_06_visible = 1;
	var button_07_visible = 1;
	var button_08_visible = 1;
	var button_09_visible = 1;
	var button_10_visible = 1;
	var button_11_visible = 1;
	var button_12_visible = 1;
	var button_13_visible = 1;
	var button_14_visible = 1;
	var button_15_visible = 1;
	var button_16_visible = 1;
	var button_17_visible = 1;
	var button_18_visible = 1;
	var button_19_visible = 1;
	var button_20_visible = 1;

	var slider_01_visible = 1;
	var slider_02_visible = 1;
	var slider_03_visible = 1;
	var slider_04_visible = 1;
	var slider_05_visible = 1;
	var slider_06_visible = 1;
	var slider_07_visible = 1;
	var slider_08_visible = 1;
	var slider_09_visible = 1;
	var slider_10_visible = 1;
	var slider_11_visible = 1;
	var slider_12_visible = 1;
	var slider_13_visible = 1;
	var slider_14_visible = 1;
	var slider_15_visible = 1;
	var slider_16_visible = 1;
	var slider_17_visible = 1;
	var slider_18_visible = 1;
	var slider_19_visible = 1;
	var slider_20_visible = 1;

	// 各ボタン、スライダーの座標を設定
	var button_01_pos = [0, 0];
	var button_02_pos = [0, 0];
	var button_03_pos = [0, 0];
	var button_04_pos = [0, 0];
	var button_05_pos = [0, 0];
	var button_06_pos = [0, 0];
	var button_07_pos = [0, 0];
	var button_08_pos = [0, 0];
	var button_09_pos = [0, 0];
	var button_10_pos = [0, 0];
	var button_11_pos = [0, 0];
	var button_12_pos = [0, 0];
	var button_13_pos = [0, 0];
	var button_14_pos = [0, 0];
	var button_15_pos = [0, 0];
	var button_16_pos = [0, 0];
	var button_17_pos = [0, 0];
	var button_18_pos = [0, 0];
	var button_19_pos = [0, 0];
	var button_20_pos = [0, 0];
	
	var slider_01_pos = [0, 0];
	var slider_02_pos = [0, 0];
	var slider_03_pos = [0, 0];
	var slider_04_pos = [0, 0];
	var slider_05_pos = [0, 0];
	var slider_06_pos = [0, 0];
	var slider_07_pos = [0, 0];
	var slider_08_pos = [0, 0];
	var slider_09_pos = [0, 0];
	var slider_10_pos = [0, 0];
	var slider_11_pos = [0, 0];
	var slider_12_pos = [0, 0];
	var slider_13_pos = [0, 0];
	var slider_14_pos = [0, 0];
	var slider_15_pos = [0, 0];
	var slider_16_pos = [0, 0];
	var slider_17_pos = [0, 0];
	var slider_18_pos = [0, 0];
	var slider_19_pos = [0, 0];
	var slider_20_pos = [0, 0];
	
	//スライダーが操作される時に
	//呼びだされる関数(もし必要なら設定する)
	function slider_01_func(hval,vval,drag) {slider_01 = hval;}
	function slider_02_func(hval,vval,drag) {slider_02 = hval;}
	function slider_03_func(hval,vval,drag) {slider_03 = hval;}
	function slider_04_func(hval,vval,drag) {slider_04 = hval;}
	function slider_05_func(hval,vval,drag) {slider_05 = hval;}
	function slider_06_func(hval,vval,drag) {slider_06 = hval;}
	function slider_07_func(hval,vval,drag) {slider_07 = hval;}
	function slider_08_func(hval,vval,drag) {slider_08 = hval;}
	function slider_09_func(hval,vval,drag) {slider_09 = hval;}
	function slider_10_func(hval,vval,drag) {slider_10 = hval;}
	function slider_11_func(hval,vval,drag) {slider_11 = hval;}
	function slider_12_func(hval,vval,drag) {slider_12 = hval;}
	function slider_13_func(hval,vval,drag) {slider_13 = hval;}
	function slider_14_func(hval,vval,drag) {slider_14 = hval;}
	function slider_15_func(hval,vval,drag) {slider_15 = hval;}
	function slider_16_func(hval,vval,drag) {slider_16 = hval;}
	function slider_17_func(hval,vval,drag) {slider_17 = hval;}
	function slider_18_func(hval,vval,drag) {slider_18 = hval;}
	function slider_19_func(hval,vval,drag) {slider_19 = hval;}
	function slider_20_func(hval,vval,drag) {slider_20 = hval;}
}

var config_plugin_obj = new config_plugin();
@endscript

@return
