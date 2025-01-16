const char *colorname[] = {

  /* 8 normal colors */
  [0] = "#0E1318", /* black   */
  [1] = "#6C7269", /* red     */
  [2] = "#7C8375", /* green   */
  [3] = "#888A7A", /* yellow  */
  [4] = "#A7A992", /* blue    */
  [5] = "#C0BFA3", /* magenta */
  [6] = "#D6D5B4", /* cyan    */
  [7] = "#c2c4c5", /* white   */

  /* 8 bright colors */
  [8]  = "#5a646f",  /* black   */
  [9]  = "#6C7269",  /* red     */
  [10] = "#7C8375", /* green   */
  [11] = "#888A7A", /* yellow  */
  [12] = "#A7A992", /* blue    */
  [13] = "#C0BFA3", /* magenta */
  [14] = "#D6D5B4", /* cyan    */
  [15] = "#c2c4c5", /* white   */

  /* special colors */
  [256] = "#0E1318", /* background */
  [257] = "#c2c4c5", /* foreground */
  [258] = "#c2c4c5",     /* cursor */
};

/* Default colors (colorname index)
 * foreground, background, cursor */
 unsigned int defaultbg = 0;
 unsigned int defaultfg = 257;
 unsigned int defaultcs = 258;
 unsigned int defaultrcs= 258;
