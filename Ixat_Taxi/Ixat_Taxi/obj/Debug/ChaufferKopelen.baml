   M S B A M L   `   `   `  ����D  @Ixat_Taxi, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null%clr-namespace:Ixat_Taxi	Ixat_Taxi  5   	       Ixat_Taxi.ChaufferKopelen   5   	   \ XPresentationFramework, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35R NWindowsBase, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35W SPresentationCore, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35D 9http://schemas.microsoft.com/winfx/2006/xaml/presentation    5   	   R NSystem.Xaml, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     5   	   @d2http://schemas.microsoft.com/expression/blend/2008     5   	   Jmc;http://schemas.openxmlformats.org/markup-compatibility/2006     5   	   )localclr-namespace:Ixat_Taxi     5   	     � Title$  ChaufferKoppelen��5   	   $	��750��6"   $
��1000��6/    � WindowStartupLocation$ CenterScreen=�6<    � 
ResizeMode$ NoResize=�6a    � WindowStyle$ 
ToolWindow=�6w   .��5	      �  � RowDefinitions 5   
   �� 5      $
��0.5* �6   �� 5      $
��0.5* �6   �� 5      $��4* �6   .+�5   
   ]� .+�5      �� $��Chauffeur koppelen��6   $��45(�62   $��
15,0,250,0q�6@   $
��Bold"�6T   $
��Left=�6f   $��Center=�6�   �� 5      -   5         ��Name$ 
btnRefresh��5   9   $��Assets/error.png��6   $��50��6.   $��Center=�6M   $��Right=�6h   $y�Hidden=�6�   �� 5      -   5         ��Name$ btnClose��5      $��Terug��6'   $��Right=�67   $��Center=�6S   $	��100��6n   $��35��6z   $��0,0,15,0q�6�   $��18(�6�   6�   5      ]� 5   
   $��15,0,0,0q�6   $��Center=�6&   $
��Left=�6A   $��1��6\   .+�5      �� $��Selecteerd een aanvraag��6   $��30(�67   $��Medium"�6E   �� 5      -   5         ��Name$ cmbAanvraag��5      $��20,0,0,0q�6,   $	��200��6>   $��30��6J   6�   5      � 5   
   $��2��6    � ColumnDefinitions 5      �� 5      �� 5       .+�5#      �� $��15q�6   .+�5$      �� $��Aanvraaggegevens��6   $��30(�64   $
��Bold"�6B   $��0,0,0,15q�6T   �� 5%      -   5        	 ��Name$	 txtAantalPassagiers��5%      $��Aantal passagiers��67   $��18(�6P   
 �� 
IsReadOnly
 . $��0,0,0,15q�6p   �� 5&      -   5        $	 txtLaadruimte��5&      $��
Laadruimte��61   $��18(�6C   
 . $��0,0,0,15q�6c   �� 5'      -   5        $	 txtTelefoon��5'      $��Telefoon��6/   $��18(�6?   
 . $��0,0,0,15q�6_   �� 5(      -   5        $	 txtDatumTijd��5(      $��Datum en tijd��60   $��18(�6E   
 . $��0,0,0,15q�6e   �� 5)      -   5        $	 txtEmail��5)      $��Email��6,   $��18(�69   
 . $��0,0,0,15q�6Y   ]� 5*      .+�5+      �� $��Selecteer een chauffeur��6    $��18(�6?   $
��Bold"�6M   $��	0,0,10,15q�6_   �� 5,      -	   5        $ cmbChauffeur��5,      $��18(�65   $��0,0,0,15q�6C   5-      �� 5.      -
   5        $ 	btnKoppel��5.      $��Koppel��6,   $��18(�6=   
���/���$��0,0,0,15q�6d   6v   5/      � 51      $��1��6   .+�52      (  "System.Windows.Controls.WebBrowser  -   5          Name$ wbMaps��52         Source$  https://www.google.nl/maps?�6-   53      54      57      58      