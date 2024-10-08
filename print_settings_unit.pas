
(*
================================================================================

    This file is part of OpenTemplot2024, a computer program for the design of model railway track.
    Copyright (C) 2024  Martin Wynne and OpenTemplot contributors.    email: martin@85a.uk

    This program is free software: you may redistribute it and/or modify
    it under the terms of the GNU General Public Licence as published by
    the Free Software Foundation, either version 3 of the Licence, or
    (at your option) any later version.

    This program is distributed in the hope that it will be useful,
    but WITHOUT ANY WARRANTY; without even the implied warranty of
    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.
    See the GNU General Public Licence for more details.

    You should have received a copy of the GNU General Public Licence
    along with this program. See the file: licence.txt

    Or if not, refer to the web site: https://www.gnu.org/licenses/

================================================================================

   This file was saved from Delphi5

   This file was derived from Templot2 version 244e

*)

(*
"""
================================================================================
	Changes applied
================================================================================
	SC 19-SEP-2024 556
		Add object output_omit_S1_labels_checkbox.Tcheckbox to chairing_group in print_settings_unit.lfm
	sc 17-sep-2024 556.

================================================================================
"""
*)


unit print_settings_unit;

{$MODE Delphi}

{$ALIGN OFF}

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, ComCtrls, StdCtrls, Buttons, Menus;

type

  { Tprint_settings_form }

  Tprint_settings_form = class(TForm)
    chair_group_label: TLabel;
    Label10: TLabel;
    output_chairs_checkbox: TCheckBox;
    output_chair_infill_colour_button: TButton;
    output_chair_labels_checkbox: TCheckBox;
    output_chair_label_colour_button: TButton;
    output_omit_S1_labels_checkbox: TCheckBox;
    pcic_colour_panel: TPanel;
    plic_colour_panel: TPanel;
    Shape1: TShape;
    top_label: TLabel;
    blue_corner_panel: TPanel;
    size_updown: TUpDown;
    datestamp_label: TLabel;
    spacer_label: TLabel;
    close_panel: TPanel;
    close_button: TButton;
    output_rails_checkbox: TCheckBox;
    output_centrelines_checkbox: TCheckBox;
    output_timbering_checkbox: TCheckBox;
    output_radial_centres_checkbox: TCheckBox;
    output_bgnd_shapes_checkbox: TCheckBox;
    output_fb_foot_lines_checkbox: TCheckBox;
    output_radial_ends_checkbox: TCheckBox;
    Label1: TLabel;
    output_switch_labels_checkbox: TCheckBox;
    Label2: TLabel;
    Label3: TLabel;
    output_sketchboard_items_checkbox: TCheckBox;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    output_xing_labels_checkbox: TCheckBox;
    output_symbols_checkbox: TCheckBox;
    output_timber_centres_checkbox: TCheckBox;
    output_timber_numbers_checkbox: TCheckBox;
    output_timber_extensions_checkbox: TCheckBox;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    output_rail_joints_checkbox: TCheckBox;
    output_guide_marks_checkbox: TCheckBox;
    output_switch_drive_checkbox: TCheckBox;
    output_timb_id_prefix_checkbox: TCheckBox;
    output_platforms_checkbox: TCheckBox;
    output_trackbed_edges_checkbox: TCheckBox;
    Shape2: TShape;
    top_label1: TLabel;
    procedure pcic_colour_panelClick(Sender: TObject);
    procedure plic_colour_panelClick(Sender: TObject);
    procedure size_updownClick(Sender: TObject; Button: TUDBtnType);
    procedure FormCreate(Sender: TObject);
    procedure close_buttonClick(Sender: TObject);
    procedure output_timbering_checkboxClick(Sender: TObject);
    procedure output_timber_numbers_checkboxClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;




var

  print_settings_form: Tprint_settings_form;


                     //  printer default colours and line widths...

  save_fc:integer=clLime;      //  print_labels_font default colour;
  save_tnfc:integer=clBlack;   //  print_timber_numbers_font default colour;

  save_cpnfc:integer=clBlack;  // 0.93.a added print corner numbers font default colour

  print_railedge_colour:integer=$00010101;   // virtual black.
  virtual_black_colour:integer=$00010101;    // HP bug work-around.
  save_prc:integer=$00010101;                // default for colour printing.

  printgrid_colour:integer=clAqua;           // printed grid lines.
  save_grc:integer=clAqua;

  printmargin_colour:integer=clFuchsia;      // printed trim margins.
  save_pmc:integer=clFuchsia;

  printtimber_colour:integer=clBlack; //clBlue;
  save_ptc:integer=clBlack;           //clBlue;

  printtimber_infill_colour:integer=$00E0FFFF;    // 209c  was $00C0FFFF;       // printed timbering.  cream infill.
  save_ptic:integer=$00E0FFFF;                    // 209c  was $00C0FFFF;

  printcurail_colour:integer=$00010101;  //virtual_black_colour;   // rail edge colour for control template.
  printbgrail_colour:integer=$00010101;  //virtual_black_colour;   // rail edge colour for background templates.

  printrail_infill_colour_cu:integer=$0080B0E8;   // 209c  was $006090C0;    // tan/rusty printed rails (control template).
  save_priccu:integer=$0080B0E8;                  // 209c  was $006090C0;

  printrail_infill_colour_bg:integer=$00F0D0B4;  // 214a         was $00E8B080;   // 209c  was $00C09060;    // steely-blue.   //$0090C060 sea-green printed rails (background templates).
  save_pricbg:integer=$00F0D0B4;                 // 214a         was $00E8B080;   // 209c  was $00C09060;

           // 0.93.a platforms ..

  printplat_edge_colour:integer=$005080A0;     // browny-orange platform edges
  save_priplatedge:integer=$005080A0;
  printplat_infill_colour:integer=$00DCECF4;   // light tan platform infill
  save_priplatfill:integer=$00DCECF4;

  sb_track_bgnd_colour:integer=$0090D8D8;  // 206a
  save_sb_track_bgnd:integer=$0090D8D8;    // 206a

  sb_diagram_colour:integer=$00E4C0A0;   // 223d       was $00C4A07C; steel blue
  save_sb_diagram_col:integer=$00E4C0A0; // 223d       was $00C4A07C; steel blue

  printgrid_thick:extended=0.02;             // mm minimum thickness.
  printpicborder_thick:extended=0.02;        // mm minimum thickness. (1 dot).

  printmargin_thick:extended=0.22;           // mm.
  printshape_thick:extended=0.22;            // mm.

  printtimber_thick:extended=0.16;           // mm.
  printrail_thick:extended=0.16;             // mm.
  printmark_thick:extended=0.16;             // mm.

  printcl_thick:extended=0.02;               // mm. track centre-lines 0.79.a minimum thickness. (1 dot).

  printguide_colour:integer=$000070F0;        // 211b orange was fuchsia
  save_pgc:integer=$000070F0;                 // 211b orange was fuchsia

  printjoint_colour:integer=clBlack;
  save_pjc:integer=clBlack;

  printalign_colour:integer=clLime;
  save_pac:integer=clLime;

  printshape_colour:integer=clFuchsia;
  save_psc:integer=clFuchsia;

  printbg_single_colour:integer=clPurple;
  save_pbg:integer=clPurple;


  print_labels_font:TFont;
  printer_text_font:TFont;
  print_timber_numbers_font:TFont;

  print_corner_page_numbers_font:TFont;  // 0.93.a

  printchair_colour:integer=$000050B0;
  save_pcc:integer=$000050B0;

  printchair_infill_colour:integer=$00E0E8FF;
  save_pcic:integer=$00E0E8FF;

  printchair_label_infill_colour:integer=$00C4E4FF;
  save_plic:integer=$00C4E4FF;

  out_factor:extended=1.0;     // output scaling factor.

  function create_fb_kludge_templates:integer;
  procedure delete_fb_kludge_templates;


implementation

{$BOOLEVAL ON}


{$R *.lfm}

uses
  control_room,pad_unit,math_unit,keep_select,bgkeeps_unit,help_sheet,shove_timber,
  colour_unit, wait_message;

//______________________________________________________________________________

procedure Tprint_settings_form.size_updownClick(Sender: TObject; Button: TUDBtnType);

begin
  if size_updown.Position>size_updown.Tag                          // ! position goes up, size goes down.
     then ScaleBy(9,10);                                           // scale the form contents down.

  if size_updown.Position<size_updown.Tag
     then ScaleBy(10,9);                                           // scale the form contents up.

  //ClientHeight:=VertScrollBar.Range;                               // allow 4 pixel right margin.
  //ClientWidth:=HorzScrollBar.Range+4;                              // don't need bottom margin - datestamp label provides this.
  //ClientHeight:=VertScrollBar.Range;                               // do this twice, as each affects the other.

  size_updown.Tag:=size_updown.Position;                           // and save for the next click.
end;
//______________________________________________________________________________

// SC 15-SEP-2024 556

procedure Tprint_settings_form.pcic_colour_panelClick(Sender: TObject);

          // print chair infill colour
var
  old:TColor;

begin
  old:=pcic_colour_panel.Color;
  pcic_colour_panel.Color:=get_colour('choose  a  chair  infill  colour',pcic_colour_panel.Color);
  if pcic_colour_panel.Color<>old
     then begin
            output_chairs_checkbox.Checked:=True;               // colour changed, assume she wants to use it
            printchair_infill_colour:=pcic_colour_panel.Color;
            save_pcic:=pcic_colour_panel.Color;
          end;
end;
//______________________________________________________________________________

procedure Tprint_settings_form.plic_colour_panelClick(Sender: TObject);

          // print chair label infill colour
var
  old:TColor;

begin
  old:=plic_colour_panel.Color;
  plic_colour_panel.Color:=get_colour('choose  a  chair  label  infill  colour',plic_colour_panel.Color);
  if plic_colour_panel.Color<>old
     then begin
            output_chair_labels_checkbox.Checked:=True;               // colour changed, assume she wants to use it
            printchair_label_infill_colour:=plic_colour_panel.Color;
            save_plic:=plic_colour_panel.Color;
          end;
end;

// sc 15-sep-2024 556

//______________________________________________________________________________

procedure Tprint_settings_form.FormCreate(Sender: TObject);

begin
  ClientWidth:=900;
  ClientHeight:=650;

  AutoScroll:=True;

  pcic_colour_panel.Color:=printchair_infill_colour;
  plic_colour_panel.Color:=printchair_label_infill_colour;
end;
//______________________________________________________________________________

procedure Tprint_settings_form.close_buttonClick(Sender: TObject);

begin
  Close;
end;
//______________________________________________________________________________

function highest_fb_kludge_template:integer;  // 0.94.a return highest index of a kludge template.
                                              // return -1 if none.
var
  n:integer;

begin
  RESULT:=-1;                        // init default.
  if keeps_list.Count<1 then EXIT;

  for n:=(keeps_list.Count-1) downto 0 do begin
    if Ttemplate(keeps_list.Objects[n]).template_info.keep_dims.box_dims1.fb_kludge_template_code>0
       then begin
              RESULT:=n;   // return index.
              EXIT;
            end;
  end;//next template
end;
//______________________________________________________________________________

function lowest_non_fb_kludge_template:integer;  // 0.94.a return lowest index of a non-kludge template.
                                                 // return -1 if none.
var
  n:integer;

begin
  RESULT:=-1;                        // init default.
  if keeps_list.Count<1 then EXIT;

  for n:=0 to (keeps_list.Count-1) do begin
    if Ttemplate(keeps_list.Objects[n]).template_info.keep_dims.box_dims1.fb_kludge_template_code=0
       then begin
              RESULT:=n;   // return index.
              EXIT;
            end;
  end;//next template
end;
//______________________________________________________________________________

function any_bgnd_fb:integer;   // 0.94.a  any background FB templates?

var
  n:integer;

begin
  RESULT:=0;                        // init default.
  if keeps_list.Count<1 then EXIT;

  for n:=0 to (keeps_list.Count-1) do begin
    if Ttemplate(keeps_list.Objects[n]).bg_copied=False then CONTINUE;
    if Ttemplate(keeps_list.Objects[n]).template_info.keep_dims.box_dims1.align_info.cl_only_flag=True then CONTINUE;    // 212a
    if Ttemplate(keeps_list.Objects[n]).template_info.keep_dims.box_dims1.rail_type=2 then RESULT:=RESULT+1;             // return count.
  end;//next keep
end;
//______________________________________________________________________________

function create_fb_kludge_templates:integer;

  // 0.94.a   return number of templates created

var
  count,n,n_max:integer;
  ti,saved_control:Ttemplate_info;
  l_ng,h_g:integer;

  save_bgnd_option:boolean;

begin
  count:=0;
  RESULT:=0;  // init

  if keeps_list.Count<1 then EXIT;

  if  (pad_form.gen_outer_foot_edges_menu_entry.Checked=False)
  and (pad_form.gen_inner_foot_edges_menu_entry.Checked=False)
      then EXIT; // generator switches

  if any_bgnd_fb=0 then EXIT;     // no background FB templates to kludge

  wait_form.cancel_button.Hide;
  wait_form.waiting_label.Caption:='preparing  rail - foot  edges ...';

  wait_form.waiting_label.Width:=wait_form.Canvas.TextWidth(wait_form.waiting_label.Caption);  // 205b bug fix for Wine

  wait_form.Show;

  Screen.Cursor:=crHourGlass;        // might take a while.

  Application.ProcessMessages;

  saved_control:=hold_the_control;  // 227a

  save_bgnd_option:=show_bgnd_templates;
  show_bgnd_templates:=False;

  try

    n_max:=keeps_list.Count-1;

    for n:=0 to n_max do begin
      if  (Ttemplate(keeps_list.Objects[n]).bg_copied=True)                                                   // bgnd template
      and (Ttemplate(keeps_list.Objects[n]).template_info.keep_dims.box_dims1.align_info.cl_only_flag=False)  // template has rails   212a
      and (Ttemplate(keeps_list.Objects[n]).template_info.keep_dims.box_dims1.rail_type=2)                    // FB rail
      and (Ttemplate(keeps_list.Objects[n]).template_info.keep_dims.box_dims1.fb_kludge_template_code=0)      // not if already a kludge template
          then begin
                 copy_template_info_from_to(False, Ttemplate(keeps_list.Objects[n]).template_info,ti);  // get the keep data.

                 copy_keep(ti);    // to the control template

                 no_timbering:=True;  // no timbering

                 track_centre_lines_flag:=False;   // no centre lines
                 cl_only:=False;

                 switch_drive_flag:=False; // no switch drive

                 draw_ts_platform:=False;
                 draw_ms_platform:=False;  // no plaforms

                 draw_ts_trackbed_edge:=False;
                 draw_ms_trackbed_edge:=False;  // no trackbed edges

                 adjacent_edges:=True; // no adjacent rails

                 railedges(gauge_faces,outer_edges,centre_lines);   // use these switches.

                 if pad_form.gen_inner_foot_edges_menu_entry.Checked=True
                    then begin
                           fb_kludge:=1;     // template for inner edge
                           gocalc(1,0);
                           store_and_background(False,False);

                               // put it in the group if original is in group (for printing group only)  206e  27-02-2013 ...

                           Ttemplate(keeps_list.Objects[keeps_list.Count-1]).group_selected:=Ttemplate(keeps_list.Objects[n]).group_selected;

                           INC(count);
                         end;

                 if pad_form.gen_outer_foot_edges_menu_entry.Checked=True
                    then begin
                           fb_kludge:=2;      // template for outer edge
                           gocalc(1,0);
                           store_and_background(False,False);

                               // put it in the group if original is in group (for printing group only)  206e  27-02-2013 ...

                           Ttemplate(keeps_list.Objects[keeps_list.Count-1]).group_selected:=Ttemplate(keeps_list.Objects[n]).group_selected;

                           INC(count);
                         end;

               end; //FB template
    end;//for

    if count>0       // any created?
       then begin
                   // sort  fb_kludge templates to the start of the list, so they get overprinted.

              repeat
                l_ng:=lowest_non_fb_kludge_template;

                h_g:=highest_fb_kludge_template;

                if (l_ng<>-1) and (h_g<>-1) and (l_ng<h_g)  // not if none there or already at the start
                   then begin
                          keeps_list.Move(h_g,0);     // move it to start
                          memo_list.Move(h_g,0);      // and any memo
                        end
                   else BREAK;
              until 0<>0;
            end;

  finally
    show_bgnd_templates:=save_bgnd_option;   // restore

    unhold_the_control(saved_control);   // 227a True= free lists, restore data

    Screen.Cursor:=crDefault;

    wait_form.Close;
  end;//try

  RESULT:=count;
end;
//______________________________________________________________________________

procedure delete_fb_kludge_templates;

  // 0.94.a ...

var
  i,n:integer;

begin
  if keeps_list.Count<1 then EXIT;

  if keeps_list.Count<>memo_list.Count then run_error(220);

  n:=0;
  while n<keeps_list.Count do begin

    with Ttemplate(keeps_list.Objects[n]).template_info.keep_dims.box_dims1 do begin

      if fb_kludge_template_code=0     // not a kludge template
         then begin
                INC(n);
                CONTINUE;      // leave this one.
              end;
    end;//with

    if Ttemplate(keeps_list.Objects[n]).bg_copied=True then wipe_it(n);  // any data on background

    Ttemplate(keeps_list.Objects[n]).Free;
    keeps_list.Delete(n);
    memo_list.Delete(n);

  end;//while              // no need to increment n, it is now pointing to the next keep.
end;
//______________________________________________________________________________

procedure Tprint_settings_form.output_timbering_checkboxClick(Sender: TObject);

begin
  output_timber_centres_checkbox.Enabled:=output_timbering_checkbox.Checked;
  output_timber_numbers_checkbox.Enabled:=output_timbering_checkbox.Checked;
  output_timber_extensions_checkbox.Enabled:=output_timbering_checkbox.Checked;

  output_timb_id_prefix_checkbox.Enabled:=(output_timbering_checkbox.Checked) and (output_timber_numbers_checkbox.Checked);
end;
//______________________________________________________________________________

procedure Tprint_settings_form.output_timber_numbers_checkboxClick(Sender: TObject);

begin
  output_timb_id_prefix_checkbox.Enabled:=output_timber_numbers_checkbox.Checked;
end;
//______________________________________________________________________________


end.
