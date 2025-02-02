const char *colorname[] = {

  /* 8 normal colors */
  [0] = "#101012", /* black   */
  [1] = "#817D69", /* red     */
  [2] = "#979274", /* green   */
  [3] = "#90908F", /* yellow  */
  [4] = "#B2AF8E", /* blue    */
  [5] = "#C3BD90", /* magenta */
  [6] = "#D7D19F", /* cyan    */
  [7] = "#c3c3c3", /* white   */

  /* 8 bright colors */
  [8]  = "#59596d",  /* black   */
  [9]  = "#817D69",  /* red     */
  [10] = "#979274", /* green   */
  [11] = "#90908F", /* yellow  */
  [12] = "#B2AF8E", /* blue    */
  [13] = "#C3BD90", /* magenta */
  [14] = "#D7D19F", /* cyan    */
  [15] = "#c3c3c3", /* white   */

  /* special colors */
  [256] = "#101012", /* background */
  [257] = "#c3c3c3", /* foreground */
  [258] = "#c3c3c3",     /* cursor */
};

/* Default colors (colorname index)
 * foreground, background, cursor */
 unsigned int defaultbg = 0;
 unsigned int defaultfg = 257;
 unsigned int defaultcs = 258;
 unsigned int defaultrcs= 258;
