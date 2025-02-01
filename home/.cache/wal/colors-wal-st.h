const char *colorname[] = {

  /* 8 normal colors */
  [0] = "#181818", /* black   */
  [1] = "#689D6A", /* red     */
  [2] = "#D69821", /* green   */
  [3] = "#988D73", /* yellow  */
  [4] = "#437E80", /* blue    */
  [5] = "#458588", /* magenta */
  [6] = "#B9AD8F", /* cyan    */
  [7] = "#c5c5c5", /* white   */

  /* 8 bright colors */
  [8]  = "#725d5d",  /* black   */
  [9]  = "#689D6A",  /* red     */
  [10] = "#D69821", /* green   */
  [11] = "#988D73", /* yellow  */
  [12] = "#437E80", /* blue    */
  [13] = "#458588", /* magenta */
  [14] = "#B9AD8F", /* cyan    */
  [15] = "#c5c5c5", /* white   */

  /* special colors */
  [256] = "#181818", /* background */
  [257] = "#c5c5c5", /* foreground */
  [258] = "#c5c5c5",     /* cursor */
};

/* Default colors (colorname index)
 * foreground, background, cursor */
 unsigned int defaultbg = 0;
 unsigned int defaultfg = 257;
 unsigned int defaultcs = 258;
 unsigned int defaultrcs= 258;
