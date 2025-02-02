const char *colorname[] = {

  /* 8 normal colors */
  [0] = "#10141c", /* black   */
  [1] = "#494857", /* red     */
  [2] = "#4A576C", /* green   */
  [3] = "#5C5A6C", /* yellow  */
  [4] = "#A5706A", /* blue    */
  [5] = "#566D8D", /* magenta */
  [6] = "#637A9D", /* cyan    */
  [7] = "#c3c4c6", /* white   */

  /* 8 bright colors */
  [8]  = "#5c6471",  /* black   */
  [9]  = "#494857",  /* red     */
  [10] = "#4A576C", /* green   */
  [11] = "#5C5A6C", /* yellow  */
  [12] = "#A5706A", /* blue    */
  [13] = "#566D8D", /* magenta */
  [14] = "#637A9D", /* cyan    */
  [15] = "#c3c4c6", /* white   */

  /* special colors */
  [256] = "#10141c", /* background */
  [257] = "#c3c4c6", /* foreground */
  [258] = "#c3c4c6",     /* cursor */
};

/* Default colors (colorname index)
 * foreground, background, cursor */
 unsigned int defaultbg = 0;
 unsigned int defaultfg = 257;
 unsigned int defaultcs = 258;
 unsigned int defaultrcs= 258;
