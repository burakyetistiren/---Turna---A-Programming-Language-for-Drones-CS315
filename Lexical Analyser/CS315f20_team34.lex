%option main
digit   [0-9]
sign    [+-]
integer {sign}?{digit}+
float {sign}?{digit}*(\.)?{digit}+
letter  [a-zA-Z]
char     \'[^']\'
string     \"[^"]*\"
initial ({letter}|$|_)
identifier {initial}({initial}|{digit})*
literal ({integer}|{float}|{char}|{string})

get_incl "getIncl"
get_altitude "getAltitude"
get_speed "getSpeed"
get_temp "getTemp" 
get_acceleration "getAcceleration" 
set_incl "setIncl"
set_altitude "setAltitude"
set_speed "setSpeed"
set_temp "setTemp"
set_acceleration "setAcceleration"
turn_on_cam "turnOnCam" 
turn_off_cam "turnOffCam" 
take_pict "takePict"
get_current_time_stamp "getCurrentTimeStamp"
connect_wifi "connectWifi"
take_off "takeOff"
land "land"
fly_up_with_distance "flyUpWithDistance"
fly_down_with_distance "flyDownWithDistance"
fly_left_with_distance "flyLeftWithDistance"
fly_right_with_distance "flyRightWithDistance"
fly_forward_with_distance "flyForwardWithDistance"
fly_back_with_distance "flyBackWithDistance"
rotate_cw_with_angle "rotateCwWithAngle"
rotate_ccw_with_angle "rotateCcwWithAngle"
flip_forward "flipForward"
flip_backward "flipBackward"
flip_left "flipLeft"
flip_right "flipRight"
hover_for_seconds "hoverForSeconds"
yaw_right_with_degrees "yawRightWithDegrees"
yaw_left_with_degrees "yawLeftWithDegrees"
hover "hover"
scan_int "scanInt" 
scan_str "scanStr" 
scan_float "scanFloat"
scan_bool "scanBool"
scan_char "scanChar"
print "print"
print_nl "print_nl"

comment "#".*|"#/"(.*[\n].*)*"/#"

assign_op "="
semicolon ";"
incrmnt_op "++"
decrmnt_op "--"

true "true"
false "false"
if "if"
else "else"
while "while"
for "for"
return "return"
start "start"
end "end"

lp "("
rp ")"
comma ","

const "const"
type_bool "type_bool"
type_int "type_int"
type_float "type_float"
type_char "type_char"
type_string "type_string"
void "void"

plus "+"
minus "-"
mul "*"
div "/"
mod "%"

eq_op (==|eq)
neq_op (!=|neq)
lt_op (<|lt)
lte_op (<=|lte)
gt_op (>|gt)
gte_op (>=|gte)
and (&&|and)
or (\|\||or)

%%
{comment} printf("COMMENT ");
{get_incl} printf("GET_INCL ");
{get_altitude} printf("GET_ALTITUDE ");
{get_temp} printf("GET_TEMP ");
{get_speed} printf("GET_SPEED ");
{get_acceleration} printf("GET_ACCELERATION ");
{set_incl} printf("SET_INCL ");
{set_altitude} printf("SET_ALTITUDE ");
{set_temp} printf("SET_TEMP ");
{set_speed} printf("SET_SPEED ");
{set_acceleration} printf("SET_ACCELERATION "); 
{turn_on_cam} printf("TURN_ON_CAM ");
{turn_off_cam} printf("TURN_OFF_CAM ");
{take_pict} printf("TAKE_PICT ");
{get_current_time_stamp} printf("GET_CURRENT_TIME_STAMP ");
{connect_wifi} printf("CONNECT_WIFI ");
{take_off} printf("TAKE_OFF ");
{land} printf("LAND ");
{fly_up_with_distance} printf("FLY_UP_WITH_DISTANCE ");
{fly_down_with_distance} printf("FLY_DOWN_WITH_DISTANCE ");
{fly_left_with_distance} printf("FLY_LEFT_WITH_DISTANCE ");
{fly_right_with_distance} printf("FLY_RIGHT_WITH_DISTANCE ");
{fly_forward_with_distance} printf("FLY_FORWARD_WITH_DISTANCE ");
{fly_back_with_distance} printf("FLY_BACK_WITH_DISTANCE ");
{rotate_cw_with_angle} printf("ROTATE_CW_WITH_ANGLE ");
{rotate_ccw_with_angle} printf("ROTATE_CCW_WITH_ANGLE ");
{flip_forward} printf("FLIP_FORWARD ");
{flip_backward} printf("FLIP_BACKWARD ");
{flip_left} printf("FLIP_LEFT ");
{flip_right} printf("FLIP_RIGHT ");
{hover_for_seconds} printf("HOVER_FOR_SECONDS ");
{yaw_right_with_degrees} printf("YAW_RIGHT_FOR_DEGREES ");
{yaw_left_with_degrees} printf("YAW_LEFT_FOR_DEGREES ");
{hover} printf("HOVER ");
{scan_int} printf("SCAN_INT ");
{scan_str} printf("SCAN_STR ");
{scan_float} printf("SCAN_FLOAT ");
{scan_bool} printf("SCAN_BOOL ");
{scan_char} printf("SCAN_CHAR ");
{print} printf("PRINT ");
{print_nl} printf("PRINT_NL ");
{semicolon} printf("SEMICOLON ");
{comma} printf("COMMA ");
{assign_op} printf("ASSIGN_OP ");
{incrmnt_op} printf("INCREMENT_OP ");
{decrmnt_op} printf("DECREMENT_OP ");
{eq_op} printf("EQUAL_OP ");
{neq_op} printf("NOT_EQUAL_OP ");
{lt_op} printf("LESS_THAN_OP ");
{lte_op} printf("LESS_THAN_OR_EQUAL_OP ");
{gt_op} printf("GREATER_THAN_OP ");
{gte_op} printf("GREATER_THAN_OR_EQUAL_OP ");
{and} printf("AND ");
{or} printf("OR ");
{const} printf("CONST ");
{type_bool} printf("TYPE_BOOL ");
{type_char} printf("TYPE_CHAR ");
{type_int} printf("TYPE_INT ");
{type_float} printf("TYPE_FLOAT ");
{type_string} printf("TYPE_STRING ");
{void} printf("VOID ");
{true} printf("TRUE ");
{false} printf("FALSE ");
{while} printf("WHILE ");
{for} printf("FOR ");
{start} printf("START ");
{end} printf("END ");
{if} printf("IF ");
{else} printf("ELSE ");
{return} printf("RETURN ");
{integer} printf("INTEGER ");
{float} printf("FLOAT ");
{identifier} printf("IDENTIFIER ");
{char} printf("CHAR ");
{string} printf("STRING ");
{lp} printf("LP ");
{rp} printf("RP ");
{plus} printf("PLUS ");
{minus} printf("MINUS ");
{mul} printf("MULTIPLICATION ");
{div} printf("DIVISION ");
{mod} printf("MODULO ");
