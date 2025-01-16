const char *colorname[] = {

  /* 8 normal colors */
  [0] = "#121313", /* black   */
  [1] = "#749E92", /* red     */
  [2] = "#86A994", /* green   */
  [3] = "#ADAF94", /* yellow  */
  [4] = "#C7B899", /* blue    */
  [5] = "#AEC692", /* magenta */
  [6] = "#DFD6AC", /* cyan    */
  [7] = "#c3c4c4", /* white   */

  /* 8 bright colors */
  [8]  = "#5a6e6e",  /* black   */
  [9]  = "#749E92",  /* red     */
  [10] = "#86A994", /* green   */
  [11] = "#ADAF94", /* yellow  */
  [12] = "#C7B899", /* blue    */
  [13] = "#AEC692", /* magenta */
  [14] = "#DFD6AC", /* cyan    */
  [15] = "#c3c4c4", /* white   */

  /* special colors */
  [256] = "#121313", /* background */
  [257] = "#c3c4c4", /* foreground */
  [258] = "#c3c4c4",     /* cursor */
};

/* Default colors (colorname index)
 * foreground, background, cursor */
 unsigned int defaultbg = 0;
 unsigned int defaultfg = 257;
 unsigned int defaultcs = 258;
 unsigned int defaultrcs= 258;
