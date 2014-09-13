Group_LB_Refresh =

{


                 //------REFRESH THE SQUAD LIST BOXES WITH UPDATED NAMES------//
                                    lbClear 6100;

                                    if (!isnil "Alpha") then {

		                             _listgroupsunitsA = units Alpha;
		                             _groupSizeA = count(_listgroupsunitsA);
		                             _grouptotalA = _groupSizeA - 1;
		                             _shortGroupNameA = [];

                                                  {

			                            _fixnamesA = text (name _x);
			                            _shortGroupNameA set [count _shortGroupNameA,_fixnamesA];

                                                  } forEach _listgroupsunitsA;

		                                            for "_i" from 0 to _grouptotalA do
		                                            {

		                                              _index = lbAdd [6100, str (_shortGroupNameA select _i)];

		                                            };



                                                                                                                             };


                                   lbClear 6101;

                                   if (!isnil "Bravo") then {


		                            _listgroupsunitsB = units Bravo;
		                            _groupSizeB = count(_listgroupsunitsB);
		                            _grouptotalB = _groupSizeB - 1;
		                            _shortGroupNameB = [];

		                                 {

			                            _fixnamesB = text (name _x);
			                            _shortGroupNameB set [count _shortGroupNameB,_fixnamesB];

                                                 } forEach _listgroupsunitsB;

		                                            for "_i" from 0 to _grouptotalB Do
		                                            {

		                                              _index = lbAdd [6101, str (_shortGroupNameB select _i)];

		                                            };



                                                                                                                              };


                                    lbClear 6102;

                                    if (!isnil "Charlie") then {

		                             _listgroupsunitsC = units Charlie;
		                             _groupSizeC = count(_listgroupsunitsC);
		                             _grouptotalC = _groupSizeC - 1;
		                             _shortGroupNameC = [];

                                                  {

			                            _fixnamesC = text (name _x);
			                            _shortGroupNameC set [count _shortGroupNameC,_fixnamesC];

                                                  } forEach _listgroupsunitsC;

		                                            for "_i" from 0 to _grouptotalC do
		                                            {

		                                              _index = lbAdd [6102, str (_shortGroupNameC select _i)];

		                                            };



                                                                                                                             };


                                   lbClear 6103;

                                   if (!isnil "Delta") then {


		                            _listgroupsunitsD = units Delta;
		                            _groupSizeD = count(_listgroupsunitsD);
		                            _grouptotalD = _groupSizeD - 1;
		                            _shortGroupNameD = [];

		                                 {

			                            _fixnamesD = text (name _x);
			                            _shortGroupNameD set [count _shortGroupNameD,_fixnamesD];

                                                 } forEach _listgroupsunitsD;

		                                            for "_i" from 0 to _grouptotalD Do
		                                            {

		                                              _index = lbAdd [6103, str (_shortGroupNameD select _i)];

		                                            };



                                                                                                                     };

                                   lbClear 6104;

                                   if (!isnil "Echoo") then {


                                _listgroupsunitsE = units Echoo;
                                _groupSizeE = count(_listgroupsunitsE);
                                _grouptotalE = _groupSizeE - 1;
                                _shortGroupNameE = [];

                                     {

                                  _fixnamesE = text (name _x);
                                  _shortGroupNameE set [count _shortGroupNameE,_fixnamesE];

                                                 } forEach _listgroupsunitsE;

                                                for "_i" from 0 to _grouptotalE Do
                                                {

                                                  _index = lbAdd [6104, str (_shortGroupNameE select _i)];

                                                };
                                                                                                                     };

                                   lbClear 6105;

                                   if (!isnil "Foxtrot") then {


                                _listgroupsunitsF = units Foxtrot;
                                _groupSizeF = count(_listgroupsunitsF);
                                _grouptotalF = _groupSizeF - 1;
                                _shortGroupNameF = [];

                                     {

                                  _fixnamesF = text (name _x);
                                  _shortGroupNameF set [count _shortGroupNameF,_fixnamesF];

                                                 } forEach _listgroupsunitsF;

                                                for "_i" from 0 to _grouptotalF Do
                                                {

                                                  _index = lbAdd [6105, str (_shortGroupNameF select _i)];

                                                };
                                                                                                                     };

                                   lbClear 6106;

                                   if (!isnil "Golf") then {


                                _listgroupsunitsG = units Golf;
                                _groupSizeG = count(_listgroupsunitsG);
                                _grouptotalG = _groupSizeG - 1;
                                _shortGroupNameG = [];

                                     {

                                  _fixnamesG = text (name _x);
                                  _shortGroupNameG set [count _shortGroupNameG,_fixnamesG];

                                                 } forEach _listgroupsunitsG;

                                                for "_i" from 0 to _grouptotalG Do
                                                {

                                                  _index = lbAdd [6106, str (_shortGroupNameG select _i)];

                                                };

                                                                                                                     };

                                   lbClear 6107;

                                   if (!isnil "Hotel") then {


                                _listgroupsunitsH = units Hotel;
                                _groupSizeH = count(_listgroupsunitsH);
                                _grouptotalH = _groupSizeH - 1;
                                _shortGroupNameH = [];

                                     {

                                  _fixnamesH = text (name _x);
                                  _shortGroupNameH set [count _shortGroupNameH,_fixnamesH];

                                                 } forEach _listgroupsunitsH;

                                                for "_i" from 0 to _grouptotalH Do
                                                {

                                                  _index = lbAdd [6107, str (_shortGroupNameH select _i)];

                                                };

                                                                                                                     };

                                   lbClear 6108;

                                   if (!isnil "India") then {


                                _listgroupsunitsI = units India;
                                _groupSizeI = count(_listgroupsunitsI);
                                _grouptotalI = _groupSizeI - 1;
                                _shortGroupNameI = [];

                                     {

                                  _fixnamesI = text (name _x);
                                  _shortGroupNameI set [count _shortGroupNameI,_fixnamesI];

                                                 } forEach _listgroupsunitsI;

                                                for "_i" from 0 to _grouptotalI Do
                                                {

                                                  _index = lbAdd [6108, str (_shortGroupNameI select _i)];

                                                };

                                                                                                                     };

                                   lbClear 6109;

                                   if (!isnil "Juliet") then {


                                _listgroupsunitsJ = units Juliet;
                                _groupSizeJ = count(_listgroupsunitsJ);
                                _grouptotalJ = _groupSizeJ - 1;
                                _shortGroupNameJ = [];

                                     {

                                  _fixnamesJ = text (name _x);
                                  _shortGroupNameJ set [count _shortGroupNameJ,_fixnamesJ];

                                                 } forEach _listgroupsunitsJ;

                                                for "_i" from 0 to _grouptotalJ Do
                                                {

                                                  _index = lbAdd [6109, str (_shortGroupNameJ select _i)];

                                                };

                                                                                                                     };

                                    lbClear 6110;
                                   if (!isnil "Kilo") then {


                                _listgroupsunitsK = units Kilo;
                                _groupSizeK = count(_listgroupsunitsK);
                                _grouptotalK = _groupSizeK - 1;
                                _shortGroupNameK = [];

                                     {

                                  _fixnamesK = text (name _x);
                                  _shortGroupNameK set [count _shortGroupNameK,_fixnamesK];

                                                 } forEach _listgroupsunitsK;

                                                for "_i" from 0 to _grouptotalK Do
                                                {

                                                  _index = lbAdd [6110, str (_shortGroupNameK select _i)];

                                                };

                                                                                                                     };

                                   lbClear 6111;

                                   if (!isnil "Lima") then {


                                _listgroupsunitsL = units Lima;
                                _groupSizeL = count(_listgroupsunitsL);
                                _grouptotalL = _groupSizeL - 1;
                                _shortGroupNameL = [];

                                     {

                                  _fixnamesL = text (name _x);
                                  _shortGroupNameL set [count _shortGroupNameL,_fixnamesL];

                                                 } forEach _listgroupsunitsL;

                                                for "_i" from 0 to _grouptotalL Do
                                                {

                                                  _index = lbAdd [6111, str (_shortGroupNameL select _i)];

                                                };

                                                                                                                     };

};

//---------------------------------------------------------------------------------------------------------------------Join Alpha-------------------------------------------------------------------------------------------------------//
GrpAlpha =

{




      If (!Local Player) ExitWith {};
      If (Isnil "Alpha") Then

      {

          Alpha = CreateGroup West;
          [Player] Join GrpNull;
          [Player] JoinSilent Alpha;
          PublicVariable "Alpha";
          HintSilent "Você criou o Pelotão Alpha 01 como líder";

      }

     Else //!isnil alpha

      {

            If (Group Player == Alpha) Then

            {

              HintSilent "Você já está no Pelotão Alpha 01";

            }

           Else

            {
                    If (Count Units Alpha == 0) Then

                    {
                    deleteGroup Alpha;
                    Alpha=Nil;
                    Alpha = CreateGroup West;HintSilent "Você criou o Pelotão Alpha 01 como líder";
                    publicvariable "Alpha";
                    };

                     [Player] Join GrpNull;
                     [Player] JoinSilent Alpha;


                     If (Count Units Alpha > 1) Then

                     {

                               HintSilent "Você entrou no Pelotão Alpha 01";

                                {

                                        If (RankId Player > RankId _x) Then

                                        {

                                         Alpha selectLeader Player;

                                        }



                                } ForEach Units Alpha;

                                  PublicVariable "Alpha";

                     };

            };


      };
                                    WaitUntil {Group Player == Alpha};
                                    []Spawn Group_LB_Refresh;
//


};

//--------------------------------------------------------------------------------------------------------------------------Join Bravo--------------------------------------------------------------------------------------------------//
GrpBravo =

{
      If (!Local Player) ExitWith {};
      If (IsNil "Bravo") Then

      {

          Bravo = CreateGroup West;
          [Player] Join GrpNull;
          [Player] JoinSilent Bravo;
          PublicVariable "Bravo";
          HintSilent "Você criou o Pelotão Alpha 02 como o líder";

      }

     Else

      {

            If (Group Player == Bravo) Then

            {

              HintSilent "Você já está no Pelotão Alpha 02";

            }

           Else

            {



		 If (Count Units Bravo == 0) Then


             {


   	            deleteGroup Bravo;
                    Bravo=Nil;
                    Bravo = CreateGroup West;HintSilent "Você criou o Pelotão Alpha 02 como o líder";
                    publicvariable "Bravo";
                    };

             [Player] Join GrpNull;
             [Player] JoinSilent Bravo;


              If (Count Units Bravo > 1) Then

                     {

                               HintSilent "Você entrou no Pelotão Alpha 02";

                                {

                                        If (RankId Player > RankId _x) Then

                                        {

                                         Bravo selectLeader Player;

                                        }



                                } ForEach Units Bravo;

                                  PublicVariable "Bravo";

                     };

            };


      };
                                    WaitUntil {Group Player == Bravo};
                                    []Spawn Group_LB_Refresh;


};


//-----------------------------------------------------------------------------------------------------------------------Join Charlie-------------------------------------------------------------------------------------------------//
GrpCharlie =

{
      If (!Local Player) ExitWith {};
      If (IsNil "Charlie") Then

      {

          Charlie = CreateGroup West;
          [Player] Join GrpNull;
          [Player] JoinSilent Charlie;
          PublicVariable "Charlie";
          HintSilent "Você criou o Pelotão Alpha 03 como o líder";

      }

     Else

      {

            If (Group Player == Charlie) Then

            {

              HintSilent "Você está no Pelotão Alpha 03";

            }

           Else

            {

             If (Count Units Charlie == 0) Then


             {


   		    deleteGroup Charlie;
                    Charlie=Nil;
                    Charlie = CreateGroup West;HintSilent "Você criou o Pelotão Alpha 03 como o líder";
                    publicvariable "Charlie";
                    };


             [Player] JoinSilent GrpNull;
             [Player] JoinSilent Charlie;


            If (Count Units Charlie > 1) Then

                     {

                               HintSilent "Você entrou no Pelotão Alpha 03";

                                {

                                        If (RankId Player > RankId _x) Then

                                        {

                                         Charlie selectLeader Player;

                                        }



                                } ForEach Units Charlie;

                                  PublicVariable "Charlie";

                     };

            };


      };
                                  WaitUntil {Group Player == Charlie};
                                  []Spawn Group_LB_Refresh;


};


//----------------------------------------------------------------------------------------------------------------------------Join Delta------------------------------------------------------------------------------------------------//
GrpDelta =

{
      If (!Local Player) ExitWith {};
      If (IsNil "Delta") Then

      {

          Delta = CreateGroup West;
          [Player] Join GrpNull;
          [Player] JoinSilent Delta;
          PublicVariable "Delta";
          HintSilent "Você criou o Pelotão Bravo 01 como Líder";

      }

     Else

      {

            If (Group Player == Delta) Then

            {

              HintSilent "Você está no Pelotão Bravo 01";

            }

           Else

            {

             If (Count Units Delta == 0) Then

             {


   	            deleteGroup Delta;
                    Delta=Nil;
                    Delta = CreateGroup West;HintSilent "Você criou o Pelotão Bravo 01 como o líder";
                    publicvariable "Delta";
                    };


             [Player] Join GrpNull;
             [Player] JoinSilent Delta;


            If (Count Units Delta > 1) Then

                     {

                               HintSilent "Você entrou no Pelotão Bravo 01";

                                {

                                        If (RankId Player > RankId _x) Then

                                        {

                                         Delta selectLeader Player;

                                        }



                                } ForEach Units Delta;

                                  PublicVariable "Delta";

                     };

            };


      };                          WaitUntil {Group Player == Delta};
                                  []Spawn Group_LB_Refresh;


};

//----------------------------------------------------------------------------------------------------------------------------Join Echoo------------------------------------------------------------------------------------------------//
GrpEchoo =

{
      If (!Local Player) ExitWith {};
      If (IsNil "Echoo") Then

      {

          Echoo = CreateGroup West;
          [Player] Join GrpNull;
          [Player] JoinSilent Echoo;
          PublicVariable "Echoo";
          HintSilent "Você criou o Pelotão Bravo 02 como Líder";

      }

     Else

      {

            If (Group Player == Echoo) Then

            {

              HintSilent "Você está no Pelotão Bravo 02";

            }

           Else

            {

             If (Count Units Echoo == 0) Then

             {


                deleteGroup Echoo;
                    Echoo=Nil;
                    Echoo = CreateGroup West;HintSilent "Você criou Pelotão Bravo 02 como o líder";
                    publicvariable "Echoo";
                    };


             [Player] Join GrpNull;
             [Player] JoinSilent Echoo;


            If (Count Units Echoo > 1) Then

                     {

                               HintSilent "Você entrou no Pelotão Bravo 02";

                                {

                                        If (RankId Player > RankId _x) Then

                                        {

                                         Echoo selectLeader Player;

                                        }



                                } ForEach Units Echoo;

                                  PublicVariable "Echoo";

                     };

            };


      };                          WaitUntil {Group Player == Echoo};
                                  []Spawn Group_LB_Refresh;


};

//----------------------------------------------------------------------------------------------------------------------------Join Foxtrot------------------------------------------------------------------------------------------------//
GrpFoxtrot =

{
      If (!Local Player) ExitWith {};
      If (IsNil "Foxtrot") Then

      {

          Foxtrot = CreateGroup West;
          [Player] Join GrpNull;
          [Player] JoinSilent Foxtrot;
          PublicVariable "Foxtrot";
          HintSilent "Você criou o Pelotão Bravo 03 como Líder";

      }

     Else

      {

            If (Group Player == Foxtrot) Then

            {

              HintSilent "Você está no Pelotão Bravo 03";

            }

           Else

            {

             If (Count Units Foxtrot == 0) Then

             {


                deleteGroup Foxtrot;
                    Foxtrot=Nil;
                    Foxtrot = CreateGroup West;HintSilent "Você criou o Pelotão Bravo 03 como o líder";
                    publicvariable "Foxtrot";
                    };


             [Player] Join GrpNull;
             [Player] JoinSilent Foxtrot;


            If (Count Units Foxtrot > 1) Then

                     {

                               HintSilent "Você entrou no Pelotão Bravo 03";

                                {

                                        If (RankId Player > RankId _x) Then

                                        {

                                         Foxtrot selectLeader Player;

                                        }



                                } ForEach Units Foxtrot;

                                  PublicVariable "Foxtrot";

                     };

            };


      };                          WaitUntil {Group Player == Foxtrot};
                                  []Spawn Group_LB_Refresh;


};

//----------------------------------------------------------------------------------------------------------------------------Join Golf------------------------------------------------------------------------------------------------//
GrpGolf =

{
      If (!Local Player) ExitWith {};
      If (IsNil "Golf") Then

      {

          Golf = CreateGroup West;
          [Player] Join GrpNull;
          [Player] JoinSilent Golf;
          PublicVariable "Golf";
          HintSilent "Você criou o Pelotão Charlie 01 como Líder";

      }

     Else

      {

            If (Group Player == Golf) Then

            {

              HintSilent "Você está no Pelotão Charlie 01";

            }

           Else

            {

             If (Count Units Golf == 0) Then

             {


                deleteGroup Golf;
                    Golf=Nil;
                    Golf = CreateGroup West;HintSilent "Você criou o Pelotão Charlie 01 como o líder";
                    publicvariable "Golf";
                    };


             [Player] Join GrpNull;
             [Player] JoinSilent Golf;


            If (Count Units Golf > 1) Then

                     {

                               HintSilent "Você entrou no Pelotão Charlie 01";

                                {

                                        If (RankId Player > RankId _x) Then

                                        {

                                         Golf selectLeader Player;

                                        }



                                } ForEach Units Golf;

                                  PublicVariable "Golf";

                     };

            };


      };                          WaitUntil {Group Player == Golf};
                                  []Spawn Group_LB_Refresh;


};

//----------------------------------------------------------------------------------------------------------------------------Join Hotel------------------------------------------------------------------------------------------------//
GrpHotel =

{
      If (!Local Player) ExitWith {};
      If (IsNil "Hotel") Then

      {

          Hotel = CreateGroup West;
          [Player] Join GrpNull;
          [Player] JoinSilent Hotel;
          PublicVariable "Hotel";
          HintSilent "Você criou o Pelotão Charlie 02 como Líder";

      }

     Else

      {

            If (Group Player == Hotel) Then

            {

              HintSilent "Você está no Pelotão Charlie 02";

            }

           Else

            {

             If (Count Units Hotel == 0) Then

             {


                deleteGroup Hotel;
                    Hotel=Nil;
                    Hotel = CreateGroup West;HintSilent "Você criou o Pelotão Charlie 02 como o líder";
                    publicvariable "Hotel";
                    };


             [Player] Join GrpNull;
             [Player] JoinSilent Hotel;


            If (Count Units Hotel > 1) Then

                     {

                               HintSilent "Você entrou no Pelotão Charlie 02";

                                {

                                        If (RankId Player > RankId _x) Then

                                        {

                                         Hotel selectLeader Player;

                                        }



                                } ForEach Units Hotel;

                                  PublicVariable "Hotel";

                     };

            };


      };                          WaitUntil {Group Player == Hotel};
                                  []Spawn Group_LB_Refresh;


};

//----------------------------------------------------------------------------------------------------------------------------Join India------------------------------------------------------------------------------------------------//
GrpIndia =

{
      If (!Local Player) ExitWith {};
      If (IsNil "India") Then

      {

          India = CreateGroup West;
          [Player] Join GrpNull;
          [Player] JoinSilent India;
          PublicVariable "India";
          HintSilent "Você criou o Pelotão Charlie 03 como Líder";

      }

     Else

      {

            If (Group Player == India) Then

            {

              HintSilent "Você está no Pelotão Charlie 03";

            }

           Else

            {

             If (Count Units India == 0) Then

             {


                deleteGroup India;
                    India=Nil;
                    India = CreateGroup West;HintSilent "Você criou o Pelotão Charlie 03 como o líder";
                    publicvariable "India";
                    };


             [Player] Join GrpNull;
             [Player] JoinSilent India;


            If (Count Units India > 1) Then

                     {

                               HintSilent "Você entrou no Pelotão Charlie 03";

                                {

                                        If (RankId Player > RankId _x) Then

                                        {

                                         India selectLeader Player;

                                        }



                                } ForEach Units India;

                                  PublicVariable "India";

                     };

            };


      };                          WaitUntil {Group Player == India};
                                  []Spawn Group_LB_Refresh;


};

//----------------------------------------------------------------------------------------------------------------------------Join Juliet------------------------------------------------------------------------------------------------//
GrpJuliet =

{
      If (!Local Player) ExitWith {};
      If (IsNil "Juliet") Then

      {

          Juliet = CreateGroup West;
          [Player] Join GrpNull;
          [Player] JoinSilent Juliet;
          PublicVariable "Juliet";
          HintSilent "Você criou o Pelotão Charlie 04 como Líder";

      }

     Else

      {

            If (Group Player == Juliet) Then

            {

              HintSilent "Você está no Pelotão Charlie 04";

            }

           Else

            {

             If (Count Units Juliet == 0) Then

             {


                deleteGroup Juliet;
                    Juliet=Nil;
                    Juliet = CreateGroup West;HintSilent "Você criou o Pelotão Charlie 04 como o líder";
                    publicvariable "Juliet";
                    };


             [Player] Join GrpNull;
             [Player] JoinSilent Juliet;


            If (Count Units Juliet > 1) Then

                     {

                               HintSilent "Você entrou no Pelotão Charlie 04";

                                {

                                        If (RankId Player > RankId _x) Then

                                        {

                                         Juliet selectLeader Player;

                                        }



                                } ForEach Units Juliet;

                                  PublicVariable "Juliet";

                     };

            };


      };                          WaitUntil {Group Player == Juliet};
                                  []Spawn Group_LB_Refresh;


};

//----------------------------------------------------------------------------------------------------------------------------Join Kilo------------------------------------------------------------------------------------------------//
GrpKilo =

{
      If (!Local Player) ExitWith {};
      If (IsNil "Kilo") Then

      {

          Kilo = CreateGroup West;
          [Player] Join GrpNull;
          [Player] JoinSilent Kilo;
          PublicVariable "Kilo";
          HintSilent "Você criou o Pelotão Delta 01 como Líder";

      }

     Else

      {

            If (Group Player == Kilo) Then

            {

              HintSilent "Você está no Pelotão Delta 01";

            }

           Else

            {

             If (Count Units Kilo == 0) Then

             {


                deleteGroup Kilo;
                    Kilo=Nil;
                    Kilo = CreateGroup West;HintSilent "Você criou o Pelotão Delta 01 como o líder";
                    publicvariable "Kilo";
                    };


             [Player] Join GrpNull;
             [Player] JoinSilent Kilo;


            If (Count Units Kilo > 1) Then

                     {

                               HintSilent "Você entrou no Pelotão Delta 01";

                                {

                                        If (RankId Player > RankId _x) Then

                                        {

                                         Kilo selectLeader Player;

                                        }



                                } ForEach Units Kilo;

                                  PublicVariable "Kilo";

                     };

            };


      };                          WaitUntil {Group Player == Kilo};
                                  []Spawn Group_LB_Refresh;


};



//----------------------------------------------------------------------------------------------------------------------------Join Lima------------------------------------------------------------------------------------------------//
GrpLima =

{
      If (!Local Player) ExitWith {};
      If (IsNil "Lima") Then

      {

          Lima = CreateGroup West;
          [Player] Join GrpNull;
          [Player] JoinSilent Lima;
          PublicVariable "Lima";
          HintSilent "Você criou o Pelotão Delta 02 como Líder";

      }

     Else

      {

            If (Group Player == Lima) Then

            {

              HintSilent "Você está no Pelotão Delta 02";

            }

           Else

            {

             If (Count Units Lima == 0) Then

             {


                deleteGroup Lima;
                    Lima=Nil;
                    Lima = CreateGroup West;HintSilent "Você criou o Pelotão Delta 02 como o líder";
                    publicvariable "Lima";
                    };


             [Player] Join GrpNull;
             [Player] JoinSilent Lima;


            If (Count Units Lima > 1) Then

                     {

                               HintSilent "Você entrou no Pelotão Delta 02";

                                {

                                        If (RankId Player > RankId _x) Then

                                        {

                                         Lima selectLeader Player;

                                        }



                                } ForEach Units Lima;

                                  PublicVariable "Lima";

                     };

            };


      };                          WaitUntil {Group Player == Lima};
                                  []Spawn Group_LB_Refresh;


};

GrpLoneWolf =

{
      If (!Local Player) ExitWith {};



          [Player] Join GrpNull;
          HintSilent "Você esta fora de qualquer Pelotão !!";
          PublicVariable "Alpha";
          PublicVariable "Bravo";
          PublicVariable "Charlie";
          PublicVariable "Delta";
          PublicVariable "Echoo";
          PublicVariable "Foxtrot";
          PublicVariable "Golf";
          PublicVariable "Hotel";
          PublicVariable "India";
          PublicVariable "Juliet";
          PublicVariable "Kilo";
          PublicVariable "Lima";
          //WaitUntil {Group Player == GrpNull};
          []Spawn Group_LB_Refresh;

};