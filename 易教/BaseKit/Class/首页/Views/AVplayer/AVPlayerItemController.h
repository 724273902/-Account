//
//  AVPlayerItemController.h
//  易教
//
//  Created by john wall on 2018/6/27.
//  Copyright © 2018年 john wall. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AVKit/AVKit.h>


#define BUFSIZE    100    //!< 缓冲区大小 （简单宏, 仅Doxygen）.
@interface AVPlayerItemController : AVPlayerViewController<AVPlayerViewControllerDelegate>
@property (nonatomic, copy) NSString *videoUrl;
/// 简单方法.
/**
* @brief 简要描述.
*
* 详细描述或其他.
*/

/**< 行尾注释1. appledoc不支持会变为下一项的注释, doxygen 支持, 根据英文句号自动切分简要描述与详细描述. */
/*!< 行尾注释2. appledoc不支持会变为下一项的注释, doxygen 支持, 会全部当作详细描述, 而缺少简要描述. */
///< 行尾注释3. appledoc不支持会变为下一项的注释, doxygen 支持.
//!< 行尾注释4. appledoc不支持会会忽略, doxygen 支持.

/**
 * http://appledoc.gentlebytes.com/ : 直接写url链接.
 
 
 */
/**
 * @brief 带参数的方法
 *
 * @param  value 值.
 *
 * @return 返回value.
 * @exception
 * @exception NSException 可能抛出的异常.
 *
 * @see someMethod
 * @see someMethodByInt:
 * @warning 警告: appledoc中显示为蓝色背景, Doxygen中显示为红色竖条.
 * @bug 缺陷: appledoc中显示为黄色背景, Doxygen中显示为绿色竖条.
 */


@end
