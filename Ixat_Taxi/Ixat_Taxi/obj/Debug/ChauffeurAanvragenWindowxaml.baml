   M S B A M L   `   `   `  ����D  @Ixat_Taxi, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null%clr-namespace:Ixat_Taxi	Ixat_Taxi  5   	   ,    &Ixat_Taxi.ChauffeurAanvragenWindowxaml   5   	   \ XPresentationFramework, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35R NWindowsBase, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35W SPresentationCore, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35D 9http://schemas.microsoft.com/winfx/2006/xaml/presentation    5   	   R NSystem.Xaml, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     5   	   @d2http://schemas.microsoft.com/expression/blend/2008     5   	   Jmc;http://schemas.openxmlformats.org/markup-compatibility/2006     5   	   )localclr-namespace:Ixat_Taxi     5   	     � Title$"  ChauffeurAanvragenWindowxaml��5   	   $	��750��6.   $
��1000��6;    � WindowStartupLocation$ CenterScreen=�6H    � 
ResizeMode$ NoResize=�6m    � WindowStyle$ 
ToolWindow=�6�   .��5	      �  � RowDefinitions 5   
   �� 5      $
��0.5* �6   �� 5      $
��0.5* �6   �� 5      $��4* �6   .+�5   
   ]� .+�5      �� $��Chauffeuraanvragen��6   $��45(�62   $��
15,0,250,0q�6@   $
��Bold"�6T   $
��Left=�6f   $��Center=�6�   �� 5      -   5         ��Name$ 
btnRefresh��5   9   $��Assets/error.png��6   $��50��6.   $��Center=�6M   $��Right=�6h   $y�Hidden=�6�   �� 5      -   5         ��Name$ btnClose��5      $��Terug��6'   $��Right=�67   $��Center=�6S   $	��100��6n   $��35��6z   $��0,0,15,0q�6�   $��18(�6�   6�   5      ]� 5   
   $��15,0,0,0q�6   $��Center=�6&   $
��Left=�6A   $��1��6\   .+�5      �� $��Selecteerd een aanvraag��6   $��30(�67   $��Medium"�6E   �� 5      -   5         ��Name$ cmbAanvraag��5      $��20,0,0,0q�6,   $	��200��6>   $��30��6J   6�   5      � 5   
   $��2��6    � ColumnDefinitions 5      �� 5      �� 5       .+�5#      �� $��15q�6   .+�5$      �� $��Gegevens��6   $��30(�6,   $
��Bold"�6:   $��0,0,0,15q�6L   �� 5%      -   5        	 ��Name$	 txtNaam��5%      $
��Naam��6+   $��18(�67   
 �� 
IsReadOnly
 . $��0,0,0,15q�6W   �� 5&      -   5        $	 	txtMobiel��5&      $��Mobiel��6-   $��18(�6;   
 . $��0,0,0,15q�6[   �� 5'      -   5        $	 txtEmail��5'      $��Email��6,   $��18(�69   
 . $��0,0,0,15q�6Y   �� 5(      -   5        $ cmbRijbewijs��5(      $��18(�61    �� 
IsReadOnly . $��0,0,0,15q�6Q   �� 5)      -   5        $	 txtMerkAuto��5)      $��	Merk auto��6/   $��18(�6@   
 . $��0,0,0,15q�6`   �� 5*      -	   5        $	 txtTypeAuto��5*      $��	Type auto��6/   $��18(�6@   
 . $��0,0,0,15q�6`   �� 5+      -
   5        $	 txtKenteken��5+      $��Kenteken��6/   $��18(�6?   
 . $��0,0,0,15q�6_   �� 5,      -   5        $	 txtAantalPassagiers��5,      $��Aantal passagiers��67   
 . $��18(�6b   $��0,0,0,15q�6p   �� 5-      -   5        $	 txtLaadruimte��5-      $��Laadruimte (in liters)��61   
 . $��18(�6a   $��0,0,0,15q�6o   �� 5.      -   5        $	 txtSchadeVrij��5.      $��Schade vrije jaren��61   
 . $��18(�6]   $��0,0,0,15q�6k   �� 5/      -   5        $ btnAccepteer��5/      $��
Accepteren��6/   $��18(�6D   
���/���$��0,0,0,15q�6k   6}   �� 50      -   5        $ 	btnWeiger��50      $��Weigeren��6,   $��18(�6?   
��� E��$��0,0,0,15q�6d   6v   51      � 53      $��1��6   
��� ���.+�54      �� -   5        $ cmbKlant��54      $y�Hidden=�6-   �� 55      $��Assets/IxatLogo_wit.png��6   $	��300��69   57      58      5;      5<      