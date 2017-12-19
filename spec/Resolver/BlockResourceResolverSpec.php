<?php

/**
 * This file was created by the developers from BitBag.
 * Feel free to contact us once you face any issues or want to start
 * another great project.
 * You can find more information about us on https://bitbag.shop and write us
 * an email on kontakt@bitbag.pl.
 */

declare(strict_types=1);

namespace spec\BitBag\CmsPlugin\Resolver;

use BitBag\CmsPlugin\Entity\BlockInterface;
use BitBag\CmsPlugin\Repository\BlockRepositoryInterface;
use BitBag\CmsPlugin\Resolver\BlockResourceResolver;
use BitBag\CmsPlugin\Resolver\BlockResourceResolverInterface;
use PhpSpec\ObjectBehavior;
use Psr\Log\LoggerInterface;

/**
 * @author Mikołaj Król <mikolaj.krol@bitbag.pl>
 */
final class BlockResourceResolverSpec extends ObjectBehavior
{
    function let(BlockRepositoryInterface $blockRepository, LoggerInterface $logger)
    {
        $this->beConstructedWith($blockRepository, $logger);
    }

    function it_is_initializable(): void
    {
        $this->shouldHaveType(BlockResourceResolver::class);
    }

    function it_implements_block_resource_resolver_interface(): void
    {
        $this->shouldHaveType(BlockResourceResolverInterface::class);
    }

    function it_logs_warning_if_block_was_not_found(BlockRepositoryInterface $blockRepository, LoggerInterface $logger)
    {
        $blockRepository->findOneEnabledByCode('homepage_banner')->willReturn(null);

        $logger
            ->warning(sprintf(
                'Block with "%s" code was not found in the database.',
                'homepage_banner'
            ))
            ->shouldBeCalled()
        ;

        $this->findOrLog('homepage_banner');
    }

    function it_returns_block_if_found_in_database(BlockRepositoryInterface $blockRepository, BlockInterface $block)
    {
        $blockRepository->findOneEnabledByCode('homepage_banner')->willReturn($block);

        $this->findOrLog('homepage_banner')->shouldReturn($block);
    }
}
