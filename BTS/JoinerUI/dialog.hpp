
class GJoiner
{
    idd = 3000;
    movingenable = true;
    onLoad = "uiNamespace setVariable ['myDisplay', (_this select 0)]";

    class Controls
    {


      /* --------------------------------

            BackGround Image (IPod)

       ------------------------------- */
      class ICE_JoinerBG: IcePicture
      {
	idc = -1;
	text = "BTS\JoinerUI\Images\joiner_bg.paa";
	x = 0.0 * safezoneW + safezoneX;
	y = 0.0 * safezoneH + safezoneY;
	w = 0.9 * safezoneW;
	h = 1.1 * safezoneH;
      };



      /* --------------------------------

          List Boxes (player names)

       ------------------------------- */
      class ICE_Joiner_LBA: IceLB
      {
	idc = 6100;
	text = "";
	x = 0.120 * safezoneW + safezoneX;
	y = 0.28 * safezoneH + safezoneY;
	w = 0.085 * safezoneW;
	h = 0.2 * safezoneH;

		class ListScrollBar : ScrollBar
		{
			color[] = {1,1,1,1};
			autoScrollEnabled = 1;

			colorActive[] = {1, 1, 1, 1};
			colorDisabled[] = {1, 1, 1, 0.3};
			thumb = "\A3\ui_f_data\gui\cfg\scrollbar\thumb_ca.paa";
			arrowFull = "\A3\ui_f_data\gui\cfg\scrollbar\arrowFull_ca.paa";
			arrowEmpty = "\A3\ui_f_data\gui\cfg\scrollbar\arrowEmpty_ca.paa";
			border = "\A3\ui_f_data\gui\cfg\scrollbar\border_ca.paa";
		};
      };

      class ICE_Joiner_LBB: IceLB
      {
	idc = 6101;
	text = "";
	x = 0.221 * safezoneW + safezoneX;
	y = 0.28 * safezoneH + safezoneY;
	w = 0.085 * safezoneW;
	h = 0.2 * safezoneH;

	class ListScrollBar : ScrollBar
		{
			color[] = {1,1,1,1};
			autoScrollEnabled = 1;

			colorActive[] = {1, 1, 1, 1};
			colorDisabled[] = {1, 1, 1, 0.3};
			thumb = "\A3\ui_f_data\gui\cfg\scrollbar\thumb_ca.paa";
			arrowFull = "\A3\ui_f_data\gui\cfg\scrollbar\arrowFull_ca.paa";
			arrowEmpty = "\A3\ui_f_data\gui\cfg\scrollbar\arrowEmpty_ca.paa";
			border = "\A3\ui_f_data\gui\cfg\scrollbar\border_ca.paa";
		};
      };

      class ICE_Joiner_LBC: IceLB
      {
	idc = 6102;
	text = "";
	x = 0.323 * safezoneW + safezoneX;
	y = 0.28 * safezoneH + safezoneY;
	w = 0.085 * safezoneW;
	h = 0.2 * safezoneH;

	class ListScrollBar : ScrollBar
		{
			color[] = {1,1,1,1};
			autoScrollEnabled = 1;

			colorActive[] = {1, 1, 1, 1};
			colorDisabled[] = {1, 1, 1, 0.3};
			thumb = "\A3\ui_f_data\gui\cfg\scrollbar\thumb_ca.paa";
			arrowFull = "\A3\ui_f_data\gui\cfg\scrollbar\arrowFull_ca.paa";
			arrowEmpty = "\A3\ui_f_data\gui\cfg\scrollbar\arrowEmpty_ca.paa";
			border = "\A3\ui_f_data\gui\cfg\scrollbar\border_ca.paa";
		};
      };

      class ICE_Joiner_LBD: IceLB
      {
	idc = 6103;
	text = "";
	x = 0.426 * safezoneW + safezoneX;
	y = 0.28 * safezoneH + safezoneY;
	w = 0.085 * safezoneW;
	h = 0.2 * safezoneH;

	class ListScrollBar : ScrollBar
		{
			color[] = {1,1,1,1};
			autoScrollEnabled = 1;

			colorActive[] = {1, 1, 1, 1};
			colorDisabled[] = {1, 1, 1, 0.3};
			thumb = "\A3\ui_f_data\gui\cfg\scrollbar\thumb_ca.paa";
			arrowFull = "\A3\ui_f_data\gui\cfg\scrollbar\arrowFull_ca.paa";
			arrowEmpty = "\A3\ui_f_data\gui\cfg\scrollbar\arrowEmpty_ca.paa";
			border = "\A3\ui_f_data\gui\cfg\scrollbar\border_ca.paa";
		};
      };

      class ICE_Joiner_LBE: IceLB
      {
	idc = 6104;
	text = "";
	x = 0.527 * safezoneW + safezoneX;
	y = 0.28 * safezoneH + safezoneY;
	w = 0.085 * safezoneW;
	h = 0.2 * safezoneH;

	class ListScrollBar : ScrollBar
		{
			color[] = {1,1,1,1};
			autoScrollEnabled = 1;

			colorActive[] = {1, 1, 1, 1};
			colorDisabled[] = {1, 1, 1, 0.3};
			thumb = "\A3\ui_f_data\gui\cfg\scrollbar\thumb_ca.paa";
			arrowFull = "\A3\ui_f_data\gui\cfg\scrollbar\arrowFull_ca.paa";
			arrowEmpty = "\A3\ui_f_data\gui\cfg\scrollbar\arrowEmpty_ca.paa";
			border = "\A3\ui_f_data\gui\cfg\scrollbar\border_ca.paa";
		};
      };

      class ICE_Joiner_LBF: IceLB
      {
	idc = 6105;
	text = "";
	x = 0.628 * safezoneW + safezoneX;
	y = 0.28 * safezoneH + safezoneY;
	w = 0.085 * safezoneW;
	h = 0.2 * safezoneH;

	class ListScrollBar : ScrollBar
		{
			color[] = {1,1,1,1};
			autoScrollEnabled = 1;

			colorActive[] = {1, 1, 1, 1};
			colorDisabled[] = {1, 1, 1, 0.3};
			thumb = "\A3\ui_f_data\gui\cfg\scrollbar\thumb_ca.paa";
			arrowFull = "\A3\ui_f_data\gui\cfg\scrollbar\arrowFull_ca.paa";
			arrowEmpty = "\A3\ui_f_data\gui\cfg\scrollbar\arrowEmpty_ca.paa";
			border = "\A3\ui_f_data\gui\cfg\scrollbar\border_ca.paa";
		};
      };

      class ICE_Joiner_LBG: IceLB
      {
	idc = 6106;
	text = "";
	x = 0.120 * safezoneW + safezoneX;
	y = 0.565 * safezoneH + safezoneY;
	w = 0.085 * safezoneW;
	h = 0.2 * safezoneH;

		class ListScrollBar : ScrollBar
		{
			color[] = {1,1,1,1};
			autoScrollEnabled = 1;

			colorActive[] = {1, 1, 1, 1};
			colorDisabled[] = {1, 1, 1, 0.3};
			thumb = "\A3\ui_f_data\gui\cfg\scrollbar\thumb_ca.paa";
			arrowFull = "\A3\ui_f_data\gui\cfg\scrollbar\arrowFull_ca.paa";
			arrowEmpty = "\A3\ui_f_data\gui\cfg\scrollbar\arrowEmpty_ca.paa";
			border = "\A3\ui_f_data\gui\cfg\scrollbar\border_ca.paa";
		};
      };

      class ICE_Joiner_LBH: IceLB
      {
	idc = 6107;
	text = "";
	x = 0.221 * safezoneW + safezoneX;
	y = 0.565 * safezoneH + safezoneY;
	w = 0.085 * safezoneW;
	h = 0.2 * safezoneH;

		class ListScrollBar : ScrollBar
		{
			color[] = {1,1,1,1};
			autoScrollEnabled = 1;

			colorActive[] = {1, 1, 1, 1};
			colorDisabled[] = {1, 1, 1, 0.3};
			thumb = "\A3\ui_f_data\gui\cfg\scrollbar\thumb_ca.paa";
			arrowFull = "\A3\ui_f_data\gui\cfg\scrollbar\arrowFull_ca.paa";
			arrowEmpty = "\A3\ui_f_data\gui\cfg\scrollbar\arrowEmpty_ca.paa";
			border = "\A3\ui_f_data\gui\cfg\scrollbar\border_ca.paa";
		};
      };

      class ICE_Joiner_LBI: IceLB
      {
	idc = 6108;
	text = "";
	x = 0.323 * safezoneW + safezoneX;
	y = 0.565 * safezoneH + safezoneY;
	w = 0.085 * safezoneW;
	h = 0.2 * safezoneH;

		class ListScrollBar : ScrollBar
		{
			color[] = {1,1,1,1};
			autoScrollEnabled = 1;

			colorActive[] = {1, 1, 1, 1};
			colorDisabled[] = {1, 1, 1, 0.3};
			thumb = "\A3\ui_f_data\gui\cfg\scrollbar\thumb_ca.paa";
			arrowFull = "\A3\ui_f_data\gui\cfg\scrollbar\arrowFull_ca.paa";
			arrowEmpty = "\A3\ui_f_data\gui\cfg\scrollbar\arrowEmpty_ca.paa";
			border = "\A3\ui_f_data\gui\cfg\scrollbar\border_ca.paa";
		};
      };

      class ICE_Joiner_LBJ: IceLB
      {
	idc = 6109;
	text = "";
	x = 0.426 * safezoneW + safezoneX;
	y = 0.565 * safezoneH + safezoneY;
	w = 0.085 * safezoneW;
	h = 0.2 * safezoneH;

		class ListScrollBar : ScrollBar
		{
			color[] = {1,1,1,1};
			autoScrollEnabled = 1;

			colorActive[] = {1, 1, 1, 1};
			colorDisabled[] = {1, 1, 1, 0.3};
			thumb = "\A3\ui_f_data\gui\cfg\scrollbar\thumb_ca.paa";
			arrowFull = "\A3\ui_f_data\gui\cfg\scrollbar\arrowFull_ca.paa";
			arrowEmpty = "\A3\ui_f_data\gui\cfg\scrollbar\arrowEmpty_ca.paa";
			border = "\A3\ui_f_data\gui\cfg\scrollbar\border_ca.paa";
		};
      };

      class ICE_Joiner_LBK: IceLB
      {
	idc = 6110;
	text = "";
	x = 0.527 * safezoneW + safezoneX;
	y = 0.565 * safezoneH + safezoneY;
	w = 0.085 * safezoneW;
	h = 0.2 * safezoneH;

		class ListScrollBar : ScrollBar
		{
			color[] = {1,1,1,1};
			autoScrollEnabled = 1;

			colorActive[] = {1, 1, 1, 1};
			colorDisabled[] = {1, 1, 1, 0.3};
			thumb = "\A3\ui_f_data\gui\cfg\scrollbar\thumb_ca.paa";
			arrowFull = "\A3\ui_f_data\gui\cfg\scrollbar\arrowFull_ca.paa";
			arrowEmpty = "\A3\ui_f_data\gui\cfg\scrollbar\arrowEmpty_ca.paa";
			border = "\A3\ui_f_data\gui\cfg\scrollbar\border_ca.paa";
		};
      };

      class ICE_Joiner_LBL: IceLB
      {
	idc = 6111;
	text = "";
	x = 0.628 * safezoneW + safezoneX;
	y = 0.565 * safezoneH + safezoneY;
	w = 0.085 * safezoneW;
	h = 0.2 * safezoneH;

		class ListScrollBar : ScrollBar
		{
			color[] = {1,1,1,1};
			autoScrollEnabled = 1;

			colorActive[] = {1, 1, 1, 1};
			colorDisabled[] = {1, 1, 1, 0.3};
			thumb = "\A3\ui_f_data\gui\cfg\scrollbar\thumb_ca.paa";
			arrowFull = "\A3\ui_f_data\gui\cfg\scrollbar\arrowFull_ca.paa";
			arrowEmpty = "\A3\ui_f_data\gui\cfg\scrollbar\arrowEmpty_ca.paa";
			border = "\A3\ui_f_data\gui\cfg\scrollbar\border_ca.paa";
		};
      };

      /* ---------------------------------

                Invisible Buttons

      --------------------------------- */
      class ICE_Button_A: IceButtonInvis
      {
	idc = -1;
	text = "";
        action = "[] spawn GrpAlpha";
        colorBackgroundActive[] = {1,1,1,0};
        colorFocused[] = {1,1,1,0};
	x = 0.128 * safezoneW + safezoneX;
	y = 0.25 * safezoneH + safezoneY;
	w = 0.072 * safezoneW;
	h = 0.02 * safezoneH;
      };

      class ICE_Button_B: IceButtonInvis
      {
	idc = -1;
	text = "";
        action = "[] spawn GrpBravo";
        colorBackgroundActive[] = {1,1,1,0};
        colorFocused[] = {1,1,1,0};
	x = 0.229 * safezoneW + safezoneX;
	y = 0.25 * safezoneH + safezoneY;
	w = 0.072 * safezoneW;
	h = 0.02 * safezoneH;
      };

      class ICE_Button_C: IceButtonInvis
      {
	idc = -1;
	text = "";
        action = "[] spawn GrpCharlie";
        colorBackgroundActive[] = {1,1,1,0};
        colorFocused[] = {1,1,1,0};
	x = 0.329 * safezoneW + safezoneX;
	y = 0.25 * safezoneH + safezoneY;
	w = 0.072 * safezoneW;
	h = 0.02 * safezoneH;
      };

      class ICE_Button_D: IceButtonInvis
      {
	idc = -1;
	text = "";
        action = "[] spawn GrpDelta";
        colorBackgroundActive[] = {1,1,1,0};
        colorFocused[] = {1,1,1,0};
	x = 0.432 * safezoneW + safezoneX;
	y = 0.25 * safezoneH + safezoneY;
	w = 0.072 * safezoneW;
	h = 0.02 * safezoneH;
      };

      class ICE_Button_E: IceButtonInvis
      {
	idc = -1;
	text = "";
        action = "[] spawn GrpEchoo";
        colorBackgroundActive[] = {1,1,1,0};
        colorFocused[] = {1,1,1,0};
	x = 0.535 * safezoneW + safezoneX;
	y = 0.25 * safezoneH + safezoneY;
	w = 0.072 * safezoneW;
	h = 0.02 * safezoneH;
      };

      class ICE_Button_F: IceButtonInvis
      {
	idc = -1;
	text = "";
        action = "[] spawn GrpFoxtrot";
        colorBackgroundActive[] = {1,1,1,0};
        colorFocused[] = {1,1,1,0};
	x = 0.636 * safezoneW + safezoneX;
	y = 0.25 * safezoneH + safezoneY;
	w = 0.072 * safezoneW;
	h = 0.02 * safezoneH;
      };

      class ICE_Button_G: IceButtonInvis
      {
	idc = -1;
	text = "";
        action = "[] spawn GrpGolf";
        colorBackgroundActive[] = {1,1,1,0};
        colorFocused[] = {1,1,1,0};
	x = 0.128 * safezoneW + safezoneX;
	y = 0.535 * safezoneH + safezoneY;
	w = 0.072 * safezoneW;
	h = 0.02 * safezoneH;
      };

      class ICE_Button_H: IceButtonInvis
      {
	idc = -1;
	text = "";
        action = "[] spawn GrpHotel";
        colorBackgroundActive[] = {1,1,1,0};
        colorFocused[] = {1,1,1,0};
	x = 0.229 * safezoneW + safezoneX;
	y = 0.535 * safezoneH + safezoneY;
	w = 0.072 * safezoneW;
	h = 0.02 * safezoneH;
      };

      class ICE_Button_I: IceButtonInvis
      {
	idc = -1;
	text = "";
        action = "[] spawn GrpIndia";
        colorBackgroundActive[] = {1,1,1,0};
        colorFocused[] = {1,1,1,0};
	x = 0.329 * safezoneW + safezoneX;
	y = 0.535 * safezoneH + safezoneY;
	w = 0.072 * safezoneW;
	h = 0.02 * safezoneH;
      };

      class ICE_Button_J: IceButtonInvis
      {
	idc = -1;
	text = "";
        action = "[] spawn GrpJuliet";
        colorBackgroundActive[] = {1,1,1,0};
        colorFocused[] = {1,1,1,0};
	x = 0.432 * safezoneW + safezoneX;
	y = 0.535 * safezoneH + safezoneY;
	w = 0.072 * safezoneW;
	h = 0.02 * safezoneH;
      };

      class ICE_Button_K: IceButtonInvis
      {
	idc = -1;
	text = "";
        action = "[] spawn GrpKilo";
        colorBackgroundActive[] = {1,1,1,0};
        colorFocused[] = {1,1,1,0};
	x = 0.535 * safezoneW + safezoneX;
	y = 0.535 * safezoneH + safezoneY;
	w = 0.072 * safezoneW;
	h = 0.02 * safezoneH;
      };

      class ICE_Button_L: IceButtonInvis
      {
	idc = -1;
	text = "";
        action = "[] spawn GrpLima";
        colorBackgroundActive[] = {1,1,1,0};
        colorFocused[] = {1,1,1,0};
	x = 0.636 * safezoneW + safezoneX;
	y = 0.535 * safezoneH + safezoneY;
	w = 0.072 * safezoneW;
	h = 0.02 * safezoneH;
      };

      class ICE_Button_LW: IceButtonInvis
      {
	idc = -1;
	text = "";
        action = "[] spawn GrpLoneWolf";
        colorBackgroundActive[] = {1,1,1,0};
        colorFocused[] = {1,1,1,0};
	x = 0.810 * safezoneW + safezoneX;
	y = 0.615 * safezoneH + safezoneY;
	w = 0.02 * safezoneW;
	h = 0.03 * safezoneH;
		tooltip = "Sair do Pelotão";
      };

      class ICE_Button_Exit: IceButtonInvis
      {
	idc = -1;
	text = "";
        action = "closeDialog 0";
        colorBackgroundActive[] = {1,1,1,0};
        colorFocused[] = {1,1,1,0};
	x = 0.795 * safezoneW + safezoneX;
	y = 0.469 * safezoneH + safezoneY;
	w = 0.044 * safezoneW;
	h = 0.1 * safezoneH;
        tooltip = "Desligar";
      };
    };





};
